package com.yummyclimbing.mapper.user;

import java.util.List;

import com.yummyclimbing.vo.user.UserPageVO;

public interface UserPageMapper {

	List<UserPageVO> getMyParty(int uiNum);
	List<UserPageVO> getLikeParty(int uiNum);
	List<UserPageVO> getLikeMountain(int uiNum);
	List<UserPageVO> getMyBoard(int uiNum);
	List<UserPageVO> getLikeBoard(int uiNum);
}
