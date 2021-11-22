<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>[스케쥴]</title>

<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="/resources/css/main.css"> 
<script src='/resources/css/main.js'></script>
 





</head>

<body>
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
   <h3>일정 추가</h3>
     <table>
    
     <tr>
     	<td>
     		표기할 수업 명: <input type="text" name="title" id="title" >
     	</td>
     </tr>
     <tr>
     	<td>
     		클래스 이름: <input type="text" name="classnames">
     	</td>
     </tr>
     <tr>
     	<td>
     		시작일: <input type="datetime-local" name="start" id="start">
     	</td>
     </tr>
     <tr>
     	<td>
     		종료일 : <input type="datetime-local" name="end" id="end">
     	</td>
     	
     </tr>
     <tr>
     	<td>
     		학생 아이디 : <input type="text" name="st_id">
     	</td>
     </tr>
    <tr>
     	<td>
     		<input type="submit" value="일정 저장">
     	</td>
     </tr>
     </table>
    
    
    
       
   </form> 
    </div>
    
    
    
    
</body>
</html>

</html>
