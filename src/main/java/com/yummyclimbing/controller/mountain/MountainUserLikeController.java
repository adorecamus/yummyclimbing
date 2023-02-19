package com.yummyclimbing.controller.mountain;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yummyclimbing.service.mountain.MountainUserLikeService;
import com.yummyclimbing.vo.mountain.MountainUserLikeVO;

@Controller
public class MountainUserLikeController {

    //-----Dependency injection----///
	@Autowired
	private MountainUserLikeService mountainUserLikeService;
	
	//-----get------//
	@GetMapping("/mountain-likes/{miNum}")
	@ResponseBody
	public int getMountainUserLikeEnabledCount(@PathVariable(value="miNum") int miNum) {
		MountainUserLikeVO mountainUserLike = new MountainUserLikeVO();
		mountainUserLike.setMiNum(miNum);
		return mountainUserLikeService.getMountainUserLikeEnabledCount(mountainUserLike);
	}
	
	//-----post------//	
	@PostMapping("/mountain-like/check")
	@ResponseBody
	public int checkMountainUserLikeInfo(@RequestBody MountainUserLikeVO mountainUserLike) throws Exception {
		return mountainUserLikeService.checkMountainUserLikeInfo(mountainUserLike);
	}
	
	@PostMapping("/mountain-like/set")
	@ResponseBody
	public int setMountainLike(@RequestBody MountainUserLikeVO mountainUserLike) throws Exception {
		return mountainUserLikeService.setMountainUserLike(mountainUserLike);
	}
	
}
