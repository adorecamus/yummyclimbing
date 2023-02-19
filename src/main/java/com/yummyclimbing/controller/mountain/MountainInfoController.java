package com.yummyclimbing.controller.mountain;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yummyclimbing.service.mountain.MountainInfoService;
import com.yummyclimbing.vo.mountain.MountainInfoItemVO;
import com.yummyclimbing.vo.mountain.MountainSearchVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class MountainInfoController {

	@Autowired
	private MountainInfoService mountainInfoService;
	
	//*********** Get ***********//
	@GetMapping("/mountain") // 산 메인
	@ResponseBody
	public List<MountainInfoItemVO> getMountainList(MountainInfoItemVO mountainInfo){
		return mountainInfoService.selectMountainInfoList(mountainInfo);
	}
	
//	public PageInfo<MountainInfoItemVO> getMountainList(MountainInfoItemVO mountainInfo){
//		PageHelper.startPage(mountainInfo);
//		return PageInfo.of(mountainInfoService.selectMountainInfoList(mountainInfo));
//	}
	
	@GetMapping("/mountain/{miNum}")
	@ResponseBody
	public MountainInfoItemVO getMountainInfoByMiNum(@PathVariable("miNum") int miNum) {
		return mountainInfoService.selectMountainInfoByMiNum(miNum);
	}	
	
	@GetMapping("/mountain/recommended")
	@ResponseBody
	public List<MountainInfoItemVO> getRecommendedMountainList(){
		return mountainInfoService.selectRecommendedMountainInfoList();
	}
	
	@GetMapping("/mountain/search")
	@ResponseBody
	public List<MountainSearchVO> getMountainNameAndArea(MountainSearchVO mountainSearch) {
		return mountainInfoService.selectMountainNameAndArea(mountainSearch);
	}
	
	//*********** POST ***********//
	@PostMapping("/mountain/near")
	@ResponseBody
	public List<MountainInfoItemVO> getMountainInfoByPosition(@RequestBody MountainInfoItemVO mountainInfo){
		return mountainInfoService.getMountainInfoByPosition(mountainInfo);
	}
	
}
