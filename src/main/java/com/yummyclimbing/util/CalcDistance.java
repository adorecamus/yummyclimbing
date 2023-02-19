package com.yummyclimbing.util;

public class CalcDistance {
	
	private CalcDistance() {
		
	}
	
	public static Float getDistance(Float lat, Float lnt, Float lat2, Float lnt2) {
	    float theta = lnt - lnt2;
	    float dist = (float) (Math.sin(deg2rad(lat))*Math.sin(deg2rad(lat2)) + Math.cos(deg2rad(lat))*Math.cos(deg2rad(lat2))*Math.cos(deg2rad(theta)));
	    dist = (float) Math.acos(dist);
	    dist = rad2deg(dist);
	    dist = (float) (dist*60*1.1515*1609.344);

	    return Math.abs(dist/1000); //km
	}

	//10진수를 radian(라디안)으로 변환
	public static float deg2rad(float deg){
	    return (float) (deg*Math.PI/180.0);
	}
	//radian(라디안)을 10진수로 변환
	public static float rad2deg(float rad){
	    return (float) (rad*180/Math.PI);
	}
}
