package com.yummyclimbing.mapper.mountain;

import java.util.List;

import com.yummyclimbing.vo.mountain.MountainUserLikeVO;

public interface MountainUserLikeMapper {
	int getMountainUserLikeEnabledCount(MountainUserLikeVO mountainUserLike);
	List<MountainUserLikeVO> checkMountainUserLikeInfo(MountainUserLikeVO mountainUserLike);
	int insertMountainUserLike(MountainUserLikeVO mountainUserLike);
	int toggleMountainUserLike(MountainUserLikeVO mountainUserLike);
}
