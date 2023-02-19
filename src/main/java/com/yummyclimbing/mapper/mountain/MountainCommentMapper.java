package com.yummyclimbing.mapper.mountain;

import java.util.List;

import com.yummyclimbing.vo.mountain.MountainCommentVO;

public interface MountainCommentMapper {
	List<MountainCommentVO> selectMountainCommentList(MountainCommentVO mountainComment);
	List<MountainCommentVO> selectMountainCommentListAndUser(int miNum);
	int selectMountainCommentCount(MountainCommentVO mountainComment);
	int insertMountainComment(MountainCommentVO mountainComment);
	int updateMountainComment(MountainCommentVO mountainComment);
	int updateMountainCommentActive(MountainCommentVO mountainComment);
	boolean checkMountainComment(MountainCommentVO mountainComment);
}
