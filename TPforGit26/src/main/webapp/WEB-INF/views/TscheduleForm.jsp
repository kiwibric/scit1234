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
table.type02 {
  border-collapse: separate;
  border-spacing: 0;
  text-align: left;
  line-height: 1.5;
  border-top: 1px solid #ccc;
  border-left: 1px solid #ccc;
  margin : 20px 10px;
}
table.type02 th {
  color: white;
  width: 150px;
  padding: 10px;
  font-weight: 600;
  vertical-align: top;
  border-right: 1px solid #ccc;
  border-bottom: 1px solid #ccc;
  border-top: 1px solid #fff;
  border-left: 1px solid #fff;
  background: #5A78AF;
  font-size: 18px;
}
table.type02 td {
  width: 350px;
  padding: 10px;
  vertical-align: top;
  border-right: 1px solid #ccc;
  border-bottom: 1px solid #ccc;
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
  				url: 'Tschedule',
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
    
    <div>
   <form name="insertSchedule" action="insertSchedule" method="get"  onsubmit="return formCheck();">
   <h3 style="color: #1E3269; font-size: 30px;">일정 추가</h3>
     <table class="type02">
    
     <tr>
     	<th scope="row">
     		표기할 수업 명:
     	</th>
     	<td>
     		 <input type="text" name="title" id="title" >
     	</td>
     </tr>
     <tr>
     	<th scope="row">
     		클래스 이름: 
     	</th>
     	
     	<td>
     		<input type="text" name="classnames">
     	</td>
     </tr>
     <tr>
     	<th scope="row">
     		시작일: 
     	</th>
     	<td>
     		<input type="datetime-local" name="start" id="start">
     	</td>
     </tr>
     <tr>
     	<th>
     	종료일 : 
     	</th>
     	<td scope="row">
     		<input type="datetime-local" name="end" id="end">
     	</td>
     	
     </tr>
     <tr>
     	<th scope="row">
     		학생 아이디 : 
     	</th>
     	<td>
     		<input type="text" name="st_id">
     	</td>
     </tr>
   
     </table>
    <input style=" margin-left: 200px; margin-bottom: 15px; font-size: 18px; color: white;background-color:#506EA5;border-radius: 5px; " type="submit" value="일정 저장">
       
   </form> 
    </div>
    
    
    
    
</body>
</html>

</html>
