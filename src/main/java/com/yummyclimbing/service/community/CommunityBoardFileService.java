package com.yummyclimbing.service.community;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yummyclimbing.mapper.community.CommunityBoardFileMapper;
import com.yummyclimbing.vo.community.CommunityBoardFileVO;

@Service
public class CommunityBoardFileService {

	@Autowired
	private CommunityBoardFileMapper cfMapper;
	
	public List<CommunityBoardFileVO> selectFileInfos(int cbNum) {
		return cfMapper.selectFileList(cbNum);
	}

}
