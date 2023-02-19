<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main</title>
</head>
<body>
<spring:eval var="openWeatherMapAPI" expression="@envProperties['openweathermap.key']" />
<script>
const weatherDiv = document.querySelector("#weatherDiv");
const weatherIcon = document.querySelector("#weatherIcon");
const COORDS = 'coords';

 	window.onload = function(){
 		loadCoords();
	}

	function loadCoords() {
	  const loadedCoords = localStorage.getItem(COORDS); // localStorage에서 위치정보 가져옴
//	  console.log(loadedCoords);
	  if (loadedCoords === null) { // 위치 정보가 없으면
	  	askForCoords(); // 위치 정보 요청 함수
	  } else {
		  const parseCoords = JSON.parse(loadedCoords); // json형식을 객체 타입으로 바꿔서 저장
		  getWeather(parseCoords.latitude, parseCoords.longitude); // 날씨 요청 함수
	  }
	}
	
	function askForCoords() { // 사용자 위치 요청 (요청 수락, 요청 거절)
		navigator.geolocation.getCurrentPosition(handleGeoSucces, handleGeoError);
	}
	
	function handleGeoSucces(position) { // 요청 수락
		const latitude = position.coords.latitude; 
		const longitude = position.coords.longitude;
		const coordsObj = {
			latitude,
		    longitude,
		};
		saveCoords(coordsObj); // localStorage에 저장 함수
	}
	
	function saveCoords(coordsObj) { // localStorage에 저장
		localStorage.setItem(COORDS, JSON.stringify(coordsObj));
	}
	 
	function handleGeoError() { // 요청 거절
		console.log('위치 정보 거절');
	}
	
	function getWeather(lat, lon){
		const weatherURI = '?lat=' + lat + '&lon=' + lon + '&appid=${openWeatherMapAPI}&units=metric';	// units=metric : 섭씨로 설정
		const celsius = '℃';

		fetch('https://api.openweathermap.org/data/2.5/weather' + weatherURI)
		.then(response => response.json())
		.then(data => {
			console.log(data); 
		    const place = data.name;
		    const temp = data.main.temp.toFixed(1) + celsius;
		    const weathers = data.weather[data.weather.length -1];
		    weatherIcon.src = 'https://openweathermap.org/img/wn/' + weathers.icon + '@2x.png';
		    weatherDiv.innerHTML = '<br>'place + '<br>' + temp + '<br>' + weathers.main + '<br>';
			});
	}

</script>
</body>
</html>