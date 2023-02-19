package com.yummyclimbing.service.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yummyclimbing.mapper.user.UserPageMapper;
import com.yummyclimbing.vo.user.UserPageVO;

@Service
public class UserPageService {

	@Autowired
	private UserPageMapper userPageMapper;
	
	//가입한 소모임들
	public List<UserPageVO> getMyParty(int uiNum) {
		return userPageMapper.getMyParty(uiNum);
	}
	
	//좋아요 소모임들
	public List<UserPageVO> getLikeParty(int uiNum){
		return userPageMapper.getLikeParty(uiNum);
	}
	
	//좋아요 산
	public List<UserPageVO> getLikeMountain(int uiNum){
		return userPageMapper.getLikeMountain(uiNum);
	}
	
	//좋아요 커뮤니티 게시글
	public List<UserPageVO> getLikeBoard(int uiNum){
		return userPageMapper.getLikeBoard(uiNum);
	}
	
	//내가 작성한 커뮤니티 게시글
	public List<UserPageVO> getMyBoard(int uiNum){
		return userPageMapper.getMyBoard(uiNum);
	}
}
