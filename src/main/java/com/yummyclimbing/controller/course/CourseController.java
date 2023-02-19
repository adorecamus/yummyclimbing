package com.yummyclimbing.controller.course;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;

import org.locationtech.proj4j.BasicCoordinateTransform;
import org.locationtech.proj4j.CRSFactory;
import org.locationtech.proj4j.CoordinateReferenceSystem;
import org.locationtech.proj4j.ProjCoordinate;

import com.fasterxml.jackson.databind.MapperFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.yummyclimbing.vo.course.CouresGeometryVO;
import com.yummyclimbing.vo.course.CourseResponseVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class CourseController {
	public static void main(String[] args) throws IOException {
		ObjectMapper om = new ObjectMapper();
		om.configure(MapperFeature.ACCEPT_CASE_INSENSITIVE_PROPERTIES, true);
		
		File rw = new File("C:\\Users\\user\\Desktop\\4-yummy-climbing\\src\\main\\resources\\json\\");
//		File[] fileList = rw.listFiles();
//		
//		for(File file : fileList) {
//			if(file.isFile()) {
//				String fileName = file.getName();
//				log.debug("filename=>{}",fileName);
//			}
//		}
		
		FileReader fr = new FileReader("C:\\Users\\user\\Desktop\\4-yummy-climbing\\src\\main\\resources\\json\\PMNTN_도봉산_자운봉_113200102.json");
		BufferedReader br = new BufferedReader(fr);
		StringBuffer sb = new StringBuffer();
		String str = null;
		while((str=br.readLine())!=null) { 
			sb.append(str);
			sb.append("\r\n");
		}
//		log.debug("json=>{}", sb.toString());
		CourseResponseVO res = om.readValue(sb.toString(), CourseResponseVO.class);
		log.debug("res=>{}",res);
		
		CouresGeometryVO geo = res.getFeatures().get(0).getGeometry();
		double grsLatiPoint = Double.parseDouble(geo.getPaths().get(0).get(0).get(0));
		double grsLongPoint = Double.parseDouble(geo.getPaths().get(0).get(0).get(1));
		
		log.debug("Latitude=>{}",grsLatiPoint);// GRS80 경도
		log.debug("Longitude=>{}",grsLongPoint);// GRS80 위도
		CRSFactory crsFactory = new CRSFactory(); // proj4
		CoordinateReferenceSystem grs80 = crsFactory.createFromName("EPSG:5186"); // GRS80 좌표계 타원체의 TM중부(20,60)
		CoordinateReferenceSystem wgs84 = crsFactory.createFromName("EPSG:4326"); // WGS84 좌표계
		BasicCoordinateTransform pointTransformer = new BasicCoordinateTransform(grs80, wgs84); //변환객체
		ProjCoordinate grsCoord = new ProjCoordinate(grsLatiPoint, grsLongPoint);
		ProjCoordinate wgsCoord = new ProjCoordinate();
		pointTransformer.transform(grsCoord, wgsCoord); // 좌표 변환 x=경도, y=위도
		
		log.debug("pointX=>{}",wgsCoord.x);// WGS84 경도
		log.debug("pointY=>{}",wgsCoord.y);// WGS84 위도
		br.close();
		fr.close();
	}
}
