package com.yummyclimbing.mapper.party;

import java.util.List;

import com.yummyclimbing.vo.party.PartyInfoVO;
import com.yummyclimbing.vo.party.PartyMemberVO;
import com.yummyclimbing.vo.user.UserInfoVO;

public interface PartyMemberMapper {

	PartyMemberVO selectMemberCount(int piNum);
	boolean insertPartyMember(PartyMemberVO partyMember);		// 소소모임 부원 가입
	int quitPartyMember(PartyMemberVO partyMember);				// 소소모임 부원 탈퇴
	int rejoinParty(PartyMemberVO partyMember);					// 탈퇴한 부원 재가입
	
	List<UserInfoVO> selectPartyMemberList(int piNum);			// 소소모임 부원 리스트
	List<UserInfoVO> selectBlockedPartyMemberList(int piNum);	// 차단된 소소모임 부원 리스트
	int updatePartyMemberActive(PartyMemberVO partyInfo);			// 소소모임 부원 탈퇴/차단
	
	PartyMemberVO selectMemberAuth(PartyMemberVO partyMember);	// 소소모임 권한(대장/부원) 확인

	int deleteLinkedMember(int uiNum);							//계정탈퇴 시 가입한 소소모임 자동탈퇴
	List<Integer> selectPartiesByUiNum(int uiNum);				//회원 고유키로 소속된 소소모임 리스트 조회
}
