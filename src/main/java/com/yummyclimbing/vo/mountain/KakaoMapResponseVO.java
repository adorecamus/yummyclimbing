package com.yummyclimbing.vo.mountain;

import java.util.List;

import lombok.Data;

@Data
public class KakaoMapResponseVO {
	private KakaoMapMetaVO meta;
    private List<KakaoDocumentsVO> documents;
}
