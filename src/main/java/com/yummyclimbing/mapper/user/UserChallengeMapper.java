package com.yummyclimbing.mapper.user;

import java.util.List;

import com.yummyclimbing.vo.user.UserChallengeVO;

public interface UserChallengeMapper {

	List<UserChallengeVO> selectUserChallengeList(UserChallengeVO userChallenge);
	UserChallengeVO selectUserChallenge(int ucNum);
	int insertUserChallenge(UserChallengeVO userChallenge);
	int updateUserChallenge(UserChallengeVO userChallenge);
	int deleteUserChallenge(int ucNum);
}
