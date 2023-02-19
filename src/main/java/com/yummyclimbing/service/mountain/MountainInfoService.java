package com.yummyclimbing.service.mountain;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.Charset;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.yummyclimbing.mapper.mountain.MountainInfoMapper;
import com.yummyclimbing.rest.Rest;
import com.yummyclimbing.util.CalcDistance;
import com.yummyclimbing.vo.mountain.KakaoMapResponseVO;
import com.yummyclimbing.vo.mountain.MountainImgAndTourismItemVO;
import com.yummyclimbing.vo.mountain.MountainImgAndTourismResponseVO;
import com.yummyclimbing.vo.mountain.MountainInfoItemVO;
import com.yummyclimbing.vo.mountain.MountainInfoResponseVO;
import com.yummyclimbing.vo.mountain.MountainPositionItemVO;
import com.yummyclimbing.vo.mountain.MountainPositionResponseVO;
import com.yummyclimbing.vo.mountain.MountainSearchVO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@PropertySource("classpath:env.properties")
public class MountainInfoService {
	//---property value----//	
	@Value("${mountain.info.url}")
	private String mountainInfoURL; // api service url
	@Value("${mountain.img_and_traffic.url}")
	private String mountainImgAndTrafficURL; // api service(ImgAndTraffic) url
	@Value("${mountain.position.url}")
	private String mountainPositionURL; // api service(Position) url
	@Value("${mountain.service.key}")
	private String serviceKey; // api key
	@Value("${mountain.num_of_rows_hundred}")
	private int numOfRows100; // 100대 명산 산개수(100개)
	@Value("${mountain.num_of_rows_img_and_traffic}")
	private int numOfRowsImgAndTraffic; // 산 이미지&교통정보 numOfRows
	@Value("${mountain.num_of_rows_position}")
	private int numOfRowsPosition; // 산 위치 리스트 numOfRows
	@Value("${mountain.page_no}")
	private int pageNo; // 1 고정
	@Value("${kakao.map.rest.url}")
	private String kakaoMapRestAPIURL; // 카카오맵 rest 주소
	@Value("${kakao.map.rest.key}")
	private String kakaoMapRestKey; // 카카오맵 rest key
	
    //-----Dependency injection----//
	@Autowired
	public Rest rest; // rest template
	@Autowired
	public MountainInfoMapper mountainInfoMapper;
	//--Dependency injection end--//
	
	public KakaoMapResponseVO getKakaoMapInfo(String mountainName){ // kakao map REST API(키워드 검색)
		String prefixQuery = "100대 명산 ";
		String auth = "KakaoAK " + kakaoMapRestKey;
		
		HttpURLConnection con = null;
		StringBuilder response = new StringBuilder();
		
		try {
			URL url = new URL(kakaoMapRestAPIURL + "?query=" + URLEncoder.encode(prefixQuery, "UTF-8") + URLEncoder.encode(mountainName, "UTF-8"));
			//utf-8 인코딩 잊지말것
			//---essential params---//
			con = (HttpURLConnection)url.openConnection();
			con.setRequestMethod("GET");
			con.setRequestProperty("X-Requested-With", "curl");
			con.setRequestProperty("Authorization", auth);
			//---------------------//
			con.setDoOutput(true);

	        //보내고 결과값 받기
	        int responseCode = con.getResponseCode();
	        if (responseCode == 400) {
	            log.debug("400: 해당 명령을 실행할 수 없음");
	        } else if (responseCode == 401) {
	        	log.debug("401: Authorization가 잘못됨");
	        } else if (responseCode == 500) {
	        	log.debug("500: 서버 에러, 문의 필요");
	        } else { // 성공 후 응답 JSON 데이터받기 
	        	 Charset charset = Charset.forName("UTF-8");
	             BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream(), charset));
	             
	             String inputLine;
	             while ((inputLine = br.readLine()) != null) {
	             	response.append(inputLine); 
	             }
	        }
	        ObjectMapper om = new ObjectMapper();
	        KakaoMapResponseVO kakaoMapInfo = om.readValue(response.toString(), KakaoMapResponseVO.class);
	        con.disconnect();
	        return kakaoMapInfo;
	        
		} catch(Exception e) {
			throw new RuntimeException("정보 불러오기 오류");
		}
	}
	
	public List<MountainInfoItemVO> getMountainInfoListToAPI(){ // DATA.GO.KR 100대산 정보 API 데이터 가져오기
		Map<String,Object> apiParam = new HashMap<>();
		apiParam.put("servicekey", serviceKey);
		apiParam.put("pageNo", pageNo);
		apiParam.put("numOfRows", numOfRows100);
		
		MountainInfoResponseVO response = rest.getData(mountainInfoURL, MountainInfoResponseVO.class, apiParam);
		int resCount = response.getBody().getTotalCount();
		int getCount = response.getBody().getItems().size();
		
		//api 응답 개수와 list의 총개수 비교
		if(resCount!=getCount) {
			throw new RuntimeException("api정보 불러오기 오류(개수가 맞지 않습니다)");
		}
		List<MountainInfoItemVO> list = response.getBody().getItems();
		
		if(list==null) {
			throw new RuntimeException("api리스트 오류");
		}
		return list;
	}
	
	public List<MountainImgAndTourismItemVO> getMountainImgAndTrafficInfoListToAPI(){ // DATA.GO.KR 산정보 API 데이터(이미지) 가져오기
		Map<String,Object> apiParam = new HashMap<>();
		apiParam.put("servicekey", serviceKey);
		apiParam.put("pageNo", pageNo);
		apiParam.put("numOfRows", numOfRowsImgAndTraffic); // essential params
		
		MountainImgAndTourismResponseVO response = rest.getData(mountainImgAndTrafficURL, MountainImgAndTourismResponseVO.class, apiParam);
		int resCount = response.getBody().getTotalCount();
		int getCount = response.getBody().getItems().size();

		//api 응답 개수와 list의 총개수 비교
		if(resCount!=getCount) {
			throw new RuntimeException("api정보 불러오기 오류(개수가 맞지 않습니다)");
		}
//		log.debug("res=>{}",response);

		List<MountainImgAndTourismItemVO> list = response.getBody().getItems();
		
		if(list==null) {
			throw new RuntimeException("api리스트 오류");
		}
		return list;
	}
	
	public List<MountainPositionItemVO> getMountainPositionInfoListToAPI(){ // DATA.GO.KR 산위치 API 데이터 가져오기
		Map<String,Object> apiParam = new HashMap<>();
		apiParam.put("servicekey", serviceKey);
		apiParam.put("pageNo", pageNo);
		apiParam.put("numOfRows", numOfRowsPosition);
		apiParam.put("srchPlaceTpeCd", "PEAK");
		apiParam.put("type", "xml"); // essential params
		
		MountainPositionResponseVO response = rest.getData(mountainPositionURL, MountainPositionResponseVO.class, apiParam);
		int resCount = response.getBody().getTotalCount();
		int getCount = response.getBody().getItems().size();
		
		//api 응답 개수와 list의 총개수 비교
		if(resCount!=getCount) {
			throw new RuntimeException("api정보 불러오기 오류(개수가 맞지 않습니다)");
		}

		List<MountainPositionItemVO> list = response.getBody().getItems();
		
		if(list==null) {
			throw new RuntimeException("api리스트 오류");
		}
		return list;
	}
	
	public List<MountainInfoItemVO> getMountainInfoByPosition(MountainInfoItemVO mountainInfo){
		List<MountainInfoItemVO> mountainInfoList = selectMountainInfoList(null);
		
		for(MountainInfoItemVO mi : mountainInfoList) {
			mi.setDist(CalcDistance.getDistance(mountainInfo.getLat(), mountainInfo.getLot(), mi.getLat(), mi.getLot()));
		}
		
		List<MountainInfoItemVO> SortedMountainInfoList;
		SortedMountainInfoList = mountainInfoList.stream().sorted(Comparator.comparing(MountainInfoItemVO::getDist)).collect(Collectors.toList());
		// 현재위치부터 가까운 순으로 오름차순 정렬
		return SortedMountainInfoList;
	}
	
	public List<MountainInfoItemVO> selectMountainInfoList(MountainInfoItemVO mountainInfo){
		return mountainInfoMapper.selectMountainInfoList(mountainInfo);
	}

	public MountainInfoItemVO selectMountainInfoByMntnm(String mntnm) {
		return mountainInfoMapper.selectMountainInfoByMntnm(mntnm);
	}
	
	public MountainInfoItemVO selectMountainInfoByMiNum (int miNum) {
		return mountainInfoMapper.selectMountainInfoByMiNum(miNum);
	}
	
	private MountainImgAndTourismItemVO getMountainImgItemVO(List<MountainImgAndTourismItemVO> list, String mntnm) {
		for(MountainImgAndTourismItemVO obj : list) {
			if(mntnm.equals(obj.getMntnnm())){
				return obj;
			}
		}
		return null;
	}
	
	private MountainPositionItemVO getMountainPositionItemVO(List<MountainPositionItemVO> list, String mntnm) {
		for(MountainPositionItemVO obj : list) {
			if(mntnm.equals(obj.getFrtrlNm())){
				return obj;
			}
		}
		return null;
	}
	
	public int insertMountainInfo(){ // insert list
		List<MountainInfoItemVO> mountainInfoList = getMountainInfoListToAPI(); // core vo
		List<MountainImgAndTourismItemVO> mountainImgList = getMountainImgAndTrafficInfoListToAPI();
		List<MountainPositionItemVO> mountainPositionList = getMountainPositionInfoListToAPI();
		int result=0;
		
		for(MountainInfoItemVO mii : mountainInfoList) {
			MountainImgAndTourismItemVO miti = getMountainImgItemVO(mountainImgList, mii.getMntnm());
	
			if(miti!=null) {
				mii.setMntnattchimageseq(miti.getMntnattchimageseq());
				mii.setTransport(miti.getPbtrninfodscrt());
			}
			
			MountainPositionItemVO mpi = getMountainPositionItemVO(mountainPositionList, mii.getMntnm());
			if(mpi!=null) {
				mii.setLat(mpi.getLat());
				mii.setLot(mpi.getLot());
			}  else { // 좌표값 누락일 경우 카카오맵에서 조회해서 정보가 있으면 채우도록 함
				KakaoMapResponseVO kakaoMapInfo = getKakaoMapInfo(mii.getMntnm());
				if(!kakaoMapInfo.getDocuments().isEmpty()) {
					mii.setLat(Float.parseFloat(kakaoMapInfo.getDocuments().get(0).getY())); // 정보제공을 String으로 하여 변환
					mii.setLot(Float.parseFloat(kakaoMapInfo.getDocuments().get(0).getX()));
				} else { // 그래도 없으면
					mii.setLat(0f);
					mii.setLot(0f);
				}
			}
			result += mountainInfoMapper.insertMountainInfo(mii);
		}

		if(result!=mountainInfoList.size()) {
			throw new RuntimeException("삽입 오류");
			
		}
		return result;
	}
	
	public int updateMountainInfos(){ // update(단건 반복)
		List<MountainInfoItemVO> mountainInfoList = getMountainInfoListToAPI(); // core vo
		List<MountainImgAndTourismItemVO> mountainImgList = getMountainImgAndTrafficInfoListToAPI();
		List<MountainPositionItemVO> mountainPositionList = getMountainPositionInfoListToAPI();
		int result = 0;
		
		for(MountainInfoItemVO mii : mountainInfoList) {
			MountainImgAndTourismItemVO miti = getMountainImgItemVO(mountainImgList, mii.getMntnm());
			
			if(miti!=null) {
				mii.setMntnattchimageseq(miti.getMntnattchimageseq());
				mii.setTransport(miti.getPbtrninfodscrt());
			}
			
			MountainPositionItemVO mpi = getMountainPositionItemVO(mountainPositionList, mii.getMntnm());
			if(mpi!=null) {
				mii.setLat(mpi.getLat());
				mii.setLot(mpi.getLot());
			} else { // 좌표값 누락일 경우 카카오맵에서 조회해서 있으면 채우도록 함
				KakaoMapResponseVO kakaoMapInfo = getKakaoMapInfo(mii.getMntnm());
				if(!kakaoMapInfo.getDocuments().isEmpty()) {
					mii.setLat(Float.parseFloat(kakaoMapInfo.getDocuments().get(0).getY())); // 정보제공을 String으로 하여 변환
					mii.setLot(Float.parseFloat(kakaoMapInfo.getDocuments().get(0).getX()));
				} else { // 그래도 없으면
					mii.setLat(0f);
					mii.setLot(0f);
				}
				
			}
			result += mountainInfoMapper.updateMountainInfo(mii);
		}
		
		if(result!=mountainInfoList.size()) {
			throw new RuntimeException("update 누락");
		}
		return result;
	}
	
	public int deleteMountainInfoList() { // delete all(where문 없는 delete)
		return mountainInfoMapper.deleteMountainInfoList();
	}
	
	public List<MountainInfoItemVO> selectRecommendedMountainInfoList(){ //추천 산 리스트
		return mountainInfoMapper.selectRecommendedMountainList();
	}
	
	public List<MountainSearchVO> selectMountainNameAndArea(MountainSearchVO mountainSearch) { //산 이름과 지역
		return mountainInfoMapper.selectMountainNameAndArea(mountainSearch);
	}
}
