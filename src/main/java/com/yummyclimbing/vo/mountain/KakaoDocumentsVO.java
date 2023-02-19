package com.yummyclimbing.vo.mountain;

import lombok.Data;

@Data
public class KakaoDocumentsVO {
    private String place_name; // 장소명
    private String distance; // 중심좌표까지 거리
    private String place_url; // 장소 상세페이지
    private String category_name;// 카테고리 이름
    private String address_name; // 지번 주소
    private String road_address_name; // 도로명 주소
    private String id; // 장소 id
    private String phone; // 전화번호
    private String category_group_code; // 중요카테고리 그룹코드
    private String category_group_name; // 중요카테고리 그룹명
    private String x; // 경도(lng)
    private String y; // 위도(lat)
}
