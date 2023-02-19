package com.yummyclimbing.mapper.community;

import java.util.List;

import com.yummyclimbing.vo.community.CommunityBoardFileVO;

public interface CommunityBoardFileMapper {

	List<CommunityBoardFileVO> selectFileList(int cbNum);

	int insertFile(CommunityBoardFileVO cfVO);
	
	int updateFileActiveByCbfNum(List<Integer> filesToDelete);
	
	int updateFileActiveByCbNum(int cbNum);
}
