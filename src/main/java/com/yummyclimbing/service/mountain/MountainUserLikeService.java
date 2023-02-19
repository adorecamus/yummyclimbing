package com.yummyclimbing.service.mountain;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yummyclimbing.exception.AuthException;
import com.yummyclimbing.mapper.mountain.MountainUserLikeMapper;
import com.yummyclimbing.mapper.user.UserInfoMapper;
import com.yummyclimbing.util.HttpSessionUtil;
import com.yummyclimbing.vo.mountain.MountainUserLikeVO;
import com.yummyclimbing.vo.user.UserInfoVO;

@Service
public class MountainUserLikeService {
	
    //-----Dependency injection----///
	@Autowired
	private MountainUserLikeMapper mountainUserLikeMapper;
	
	@Autowired
	private UserInfoMapper userInfoMapper;
	
	// 활성화된 좋아요 갯수 가져오기
	public int getMountainUserLikeEnabledCount(MountainUserLikeVO mountainUserLike) {
		return mountainUserLikeMapper.getMountainUserLikeEnabledCount(mountainUserLike);
	}
	
	// 좋아요 정보 존재 체크
	public int checkMountainUserLikeInfo(MountainUserLikeVO mountainUserLike) throws AuthException{
		Integer sessionUiNum = HttpSessionUtil.getUserInfo().getUiNum(); // session check

		UserInfoVO checkUserInfo = userInfoMapper.selectUserInfo(sessionUiNum); // check db info with session info
		List<MountainUserLikeVO> checkMountainUserLike = mountainUserLikeMapper.checkMountainUserLikeInfo(mountainUserLike);
		//search infomation of mountainUserLike
		
		if(checkUserInfo!=null && checkUserInfo.getUiActive()!=0) {
			if(checkMountainUserLike!=null && checkMountainUserLike.size()==1 && checkMountainUserLike.get(0).getMulCnt()==1) {
				 return 1;
			}
		} else {
			throw new AuthException("유저 정보 오류 발생");
		}
		return 0;
	}
	
	//좋아요 상태 변경(없으면 레코드 추가)
	public int setMountainUserLike(MountainUserLikeVO mountainUserLike) throws AuthException {
		Integer sessionUiNum = HttpSessionUtil.getUserInfo().getUiNum(); // session check
		UserInfoVO checkUserInfo = userInfoMapper.selectUserInfo(sessionUiNum); // check db info with session info		
		List<MountainUserLikeVO> checkMountainUserLike = mountainUserLikeMapper.checkMountainUserLikeInfo(mountainUserLike);

		if(checkUserInfo!=null && checkUserInfo.getUiActive()!=0) {
			if(checkMountainUserLike==null || checkMountainUserLike.isEmpty()) {
				return mountainUserLikeMapper.insertMountainUserLike(mountainUserLike);
			}
			return mountainUserLikeMapper.toggleMountainUserLike(mountainUserLike);
		} else {
			throw new AuthException("유저 정보 오류 발생");
		}
	}
	
}
