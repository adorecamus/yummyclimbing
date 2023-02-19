package com.yummyclimbing.vo.mountain;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Data;

@Data
public class KakaoMapMetaVO {
	private KakaoSameNameVO same_name;
    private int pageable_count;
    private int total_count;
    
    @JsonProperty("is_end") // jackson에서 변환할 때 변수명 is를 인식하지 못해서 따로 지정해줬음
    private boolean is_end;
}
