package com.yummyclimbing.mapper.party;

import java.util.List;

import com.yummyclimbing.vo.party.PartyInfoVO;

public interface PartyInfoMapper {
	
	List<PartyInfoVO> selectPartyInfoList(PartyInfoVO partyInfo);			// 소소모임 리스트
	List<PartyInfoVO> selectRecommendedPartyList(PartyInfoVO partyInfo);	// 추천 소소모임 리스트
	PartyInfoVO selectPartyInfo(int piNum);									// 개별 소소모임 정보
	
	//	회원만 가능
	int insertPartyInfo(PartyInfoVO partyInfo);								// 소소모임 생성
	
	//	소소모임 대장만 가능
	int updatePartyInfo(PartyInfoVO partyInfo);								// 소소모임 정보 수정
	int updatePartyActive(int piNum);										// 소소모임 삭제(비활성화)
	int updatePartyComplete(int piNum);										// 소소모임 모집완료
	
	PartyInfoVO selectCaptainNum(PartyInfoVO partyInfo);					// 소소모임 대장 여부 확인
	
	int selectExpiredParty(String piExpdat);								// 만료 소소모임 개수
	int updatePartyCompleteByExpdat(String piExpdat);						// 만료일로 소소모임 자동 모집완료
	int selectIfPartyExpired(int piNum);									// 소소모임 만료 여부 확인
	int updatePartyCompleteByMemberCount(int piNum);						// 부원 수와 정원 비교해 소소모임 모집완료 상태 변경
	
	List<Integer> selectPiNumListByMiNum(int miNum);						// 산에 속한 소소모임 리스트
	
	List<PartyInfoVO> selectPartyInfoListForMntnm(String mntnm); 			// 산별 소소모임 리스트

	boolean deleteLinkedParty(int uiNum);									// 회원탈퇴시 소소모임도 자동탈퇴
	
}