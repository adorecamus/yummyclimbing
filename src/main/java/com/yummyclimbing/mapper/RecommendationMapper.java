package com.yummyclimbing.mapper;

import java.util.List;

import com.yummyclimbing.vo.RecommendationVO;

public interface RecommendationMapper {

	int insertRecommendedMountainAndParty(RecommendationVO recommendation);
	Integer selectMiNumForDuplicateVerification(RecommendationVO recommendation);
	
	int selectCountForDuplicateVerification();
	List<Integer> selectRecommendedMiNumList();
	
	List<String> selectCredat();
}
