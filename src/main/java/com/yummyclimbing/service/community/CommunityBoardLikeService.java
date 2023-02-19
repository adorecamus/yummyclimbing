package com.yummyclimbing.service.community;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yummyclimbing.mapper.community.CommunityBoardLikeMapper;
import com.yummyclimbing.util.HttpSessionUtil;
import com.yummyclimbing.vo.community.CommunityBoardLikeVO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class CommunityBoardLikeService {

	@Autowired
	private CommunityBoardLikeMapper cblMapper;
	
	public int likeChk(CommunityBoardLikeVO cbl) {
		return cblMapper.likeChk(cbl);
	}
	
	public boolean getLikeInfo(int cbNum) {
		CommunityBoardLikeVO cbl = new CommunityBoardLikeVO();
		cbl.setCbNum(cbNum);
		cbl.setUiNum(HttpSessionUtil.getUserInfo().getUiNum());
		
		log.debug("~~~~~~~~~likeInfo=>{}", cblMapper.getLikeInfo(cbl));
		return cblMapper.getLikeInfo(cbl) != null;
	}
	
	public int likeUp(CommunityBoardLikeVO cbl) {
		return cblMapper.likeUp(cbl);
	}
	
	public int likeDown(CommunityBoardLikeVO cbl) {
		return cblMapper.likeDown(cbl);
	}
	
	public void updateLikeChk(CommunityBoardLikeVO cbl) {
		 cblMapper.updateLikeChk(cbl);
	}
	
	public void updateLikeChkCancel(CommunityBoardLikeVO cbl) {
		cblMapper.updateLikeChkCancel(cbl);
	}
	
	public int likeCnt(int cbNum) {
		return cblMapper.likeCnt(cbNum);
	}
}
