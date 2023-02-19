package com.yummyclimbing.controller.community;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.yummyclimbing.service.community.CommunityBoardFileService;
import com.yummyclimbing.vo.community.CommunityBoardFileVO;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
public class CommunityBoardFileController {

	@Autowired
	private CommunityBoardFileService cfService;
	
	@GetMapping("/community-board-file/{cbNum}")
	public List<CommunityBoardFileVO> getFiles(@PathVariable int cbNum) {
		return cfService.selectFileInfos(cbNum);
	}
	
}
