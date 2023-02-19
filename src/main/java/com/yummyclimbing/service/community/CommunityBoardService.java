package com.yummyclimbing.service.community;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.yummyclimbing.mapper.community.CommunityBoardMapper;
import com.yummyclimbing.mapper.community.CommunityBoardFileMapper;
import com.yummyclimbing.util.HttpSessionUtil;
import com.yummyclimbing.vo.community.CommunityBoardVO;
import com.yummyclimbing.vo.community.CommunityBoardFileVO;
import com.yummyclimbing.vo.community.Criteria;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class CommunityBoardService {

	private static final String BASE_PATH;
	static {
		String osName = System.getProperty("os.name");
		if (osName.toUpperCase().contains("WINDOW")) {
			BASE_PATH = "C:";
		} else {
			BASE_PATH = "";
		}
	}

	@Autowired
	private CommunityBoardMapper communityBoardMapper;

	@Autowired
	private CommunityBoardFileMapper communityBoardFileMapper;

	// 게시판 목록 조회
	public List<CommunityBoardVO> getBoardList(CommunityBoardVO communityBoard) {
		return communityBoardMapper.selectCommunityBoardList(communityBoard);
	}

	// 게시판 카테고리별 조회
	public List<CommunityBoardVO> getBoardListByCategory(CommunityBoardVO communityBoard) {
		return communityBoardMapper.selectCommunityBoardListByCategory(communityBoard);
	}

	// 게시판 목록 페이징
	public List<CommunityBoardVO> getListPaging(Criteria cri) {
		return communityBoardMapper.selectListWithPage(cri);
	}

	public int getTotalCnt(Criteria cri) {
		return communityBoardMapper.getTotalCnt(cri);
	}

	// 게시글 조회
	public CommunityBoardVO getBoard(int cbNum) {
		if (HttpSessionUtil.getRequest().getParameter("update") == null) {
			updateViewCnt(cbNum);
		}
		return communityBoardMapper.selectCommunityBoard(cbNum);
	}

	// 게시글 등록
	public int insertBoard(CommunityBoardVO communityBoard) throws IllegalStateException, IOException {
		communityBoard.setUiNum(HttpSessionUtil.getUserInfo().getUiNum());
		if (communityBoardMapper.insertCommunityBoard(communityBoard) == 1) {
			int cbNum = communityBoard.getCbNum(); // insert한 게시글 기본키 꺼내옴
			List<MultipartFile> files = communityBoard.getMultipartFiles();
			if (files != null && insertFile(files, cbNum) != files.size()) {
				return 0;
			}
			return cbNum;
		}
		return 0;
	}
	
	// 파일 저장
	private int insertFile(List<MultipartFile> files, int cbNum) throws IllegalStateException, IOException {
		int fileInsertResult = 0;
		CommunityBoardFileVO boardFile = new CommunityBoardFileVO();
		boardFile.setCbNum(cbNum);
		for (MultipartFile file : files) {
			String cbfName = file.getOriginalFilename();
			int lastIndex = cbfName.lastIndexOf(".");
			String extName = cbfName.substring(lastIndex);
			String cbfUuid = UUID.randomUUID().toString() + extName;
			String cbfPath = BASE_PATH + "/images/community/" + cbfUuid;
			boardFile.setCbfName(cbfName);
			boardFile.setCbfPath(cbfPath);
			boardFile.setCbfUuid(cbfUuid);
			fileInsertResult += communityBoardFileMapper.insertFile(boardFile);
			File tmpFile = new File(cbfPath);
			file.transferTo(tmpFile);
		}
		return fileInsertResult;
	}

	// 게시글 삭제
	public boolean deleteBoard(int cbNum) {
		if (communityBoardMapper.deleteCommunityBoard(cbNum)== 1) {
			int fileCount = communityBoardFileMapper.selectFileList(cbNum).size();
			log.debug("~~~~~~~~~~~~~게시글 파일 사이즈=>{}", fileCount);
			if (fileCount != 0 && communityBoardFileMapper.updateFileActiveByCbNum(cbNum) != fileCount) {
				return false;
			}
			return true;
		}
		return false;
	}

	// 게시글 수정
	public boolean updateBoard(CommunityBoardVO communityBoard, int cbNum) throws IllegalStateException, IOException {
		communityBoard.setCbNum(cbNum);
		List<Integer> filesToDelete = communityBoard.getFilesToDelete();
		if (filesToDelete != null &&
				communityBoardFileMapper.updateFileActiveByCbfNum(filesToDelete) != filesToDelete.size()) {
				return false;
		}
		if (communityBoardMapper.updateCommunityBoard(communityBoard) == 1) {
			List<MultipartFile> files = communityBoard.getMultipartFiles();
			if (files != null && insertFile(files, cbNum) != files.size()) {
				return false;
			}
			return true;
		}
		return false;
	}

	// 게시글 조회수
	public int updateViewCnt(int cbNum) {
		return communityBoardMapper.updateViewCnt(cbNum);
	}

	// 게시글 총 개수
	public int getTotal() {
		return communityBoardMapper.getTotal();
	}

}
