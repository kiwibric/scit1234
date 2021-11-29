<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>ハイ、センセイ</title>

<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="/resources/css/main.css"> 
<script src='/resources/css/main.js'></script>
 
<style type="text/css">
#header{
	background: #435D7D;
	padding: 0px;
	height: 60px;
	margin-bottom: 20px;
}

#homeBtn{
	padding: 0;
	border: none;
	background: none;
}

</style>
</head>

<body>
<div id="header">
	<button id="homeBtn" type="button" onclick="location.href='/'"><img src="resources/images/logo.png"></button>
	<span style="float:right; color:white; font-size: 50px" >TEACHER MYPAGE</span>
</div>
<div id="calendar"></div>
 <script>
  
  var calendarEl = document.getElementById('calendar');
  var calendar = new FullCalendar.Calendar(calendarEl, {
	  header: {
  		left: 'prev,next today',
  		center: 'title',
  		right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
  	},
  	defaultView: 'timeGridWeek', 
  	locale: 'ko',
  	 navLinks: true, // can click day/week names to navigate views
  	editable: true,
  	allDaySlot: false,
  	eventLimit: true, // allow "more" link when too many events
  	minTime: '10:00:00',
  	maxTime: '24:00:00',
  	contentHeight: 'auto', 
  	eventSources: [{
  		events: function(info, successCallback, failureCallback) {
  			$.ajax({
  				url: 'Sschedule',
  				method: 'get',
  				success: function(data) {
  					console.log(data);
  					successCallback(data);
  				}
  			});
  		}
  	}]
  });
  		

  calendar.render();

    </script>
    

    
    
    
    
</body>
</html>

</html>
