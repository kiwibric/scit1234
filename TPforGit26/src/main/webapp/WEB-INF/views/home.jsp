<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>ハイ、センセイ</title>
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
window.Kakao.init("70c694b81b704b2c7e731d265ba97a3a");

function kakaoLogin(){
	window.Kakao.Auth.login({
		scope:'profile_nickname, gender, account_email, profile_image',
		success: function(authObj){
			console.log(authObj);
			window.Kakao.API.request({
				url:'/v2/user/me', 
				success: res=>{
					const kakao_account = res.kakao_account;
					console.log(kakao_account.profile.profile_image_url);
					var userNick = kakao_account.profile.nickname;
					var gender = kakao_account.gender;
					var email = kakao_account.email;
					var image = kakao_account.profile.profile_image_url;
					var check = 0;
					$.ajax({
						url : "/tcCheck",
						type : "get",
						dataType : "json",
						data : {
							"userNick" : userNick
						},
						success : function(data) {
							console.log("server data : tc" + data);
							if (data == true){
								location.replace("/teacherMypageTemp?userNick="+userNick);
							} else{
								$.ajax({
									url : "/stCheck",
									type : "get",
									dataType : "json",
									data : {
										"userNick" : userNick
									},
									success : function(data) {
										console.log("server data : " + data);
										if (data == true){
											location.replace("/map?st_id="+userNick);
										}else{
											location.replace("/joinForm?userNick="+userNick+"&gender="+gender+"&email="+email+"&image="+image);
										}
										
									},
									error : function(e) {
										console.log(e);
									}
								});
							}
							
						},
						error : function(e) {
							console.log(e);
						}
					});
					
				}
			});
		}
	});
}
function kakaoLogout() {
    if (Kakao.Auth.getAccessToken()) {
      Kakao.API.request({
        url: '/v1/user/unlink',
        success: function (response) {
        	console.log(response)
        },
        fail: function (error) {
          console.log(error)
        },
      })
      Kakao.Auth.setAccessToken(undefined)
    }
  }  
</script>

<style>


body {
	color: #566787;
	background: #f5f5f5;
	font-family: 'Varela Round', sans-serif;
	font-size: 13px;
}

.table-wrapper {
	padding: 10px 5px;
}

.table-title {
	padding-bottom: 0px;
	background: #435d7d;
	color: #fff; /*제목색*/
	padding: 10px 20px;
	border-radius: 3px 3px 0 0;
}

.table-title h2 {
	margin: 5px 0 0;
	font-size: 24px;
}

table.table tr th, table.table tr td {
	border-color: #e9e9e9;
	padding: 12px 5px;
	vertical-align: middle;
}

table.table-striped tbody tr:nth-of-type(odd) {
	background-color: #f4f4f4;
}

th, td {
	text-align: center;
}
</style>

</head>
<body>
	<div class="table-title">
		<div class="row">
			<div class="col-xs-6">
			<br>
				<h2>
					　
				</h2>
			</div>
		</div>
	</div>
	
	<div id="content">
		<ul>
		<c:choose>
			<c:when test="${not empty sessionScope.tcLogin }">
				<h1>${sessionScope.tcLogin}님환영합니다.</h1>
				<a href="teacherMypage">센세마이페이지</a>

			</c:when>
			<c:when test="${not empty sessionScope.stLogin }">
				<h1>${sessionScope.stLogin}님환영합니다.</h1>
				<a href="map?st_id=${sessionScope.stLogin }">MAP</a>
			</c:when>
			<c:otherwise>
				<table width="70%" align="left">
					<tr><td><img src="/resources/images/pt.jpg" width="45%"></td></tr><tr>
					<td><a href="javascript:kakaoLogin();"><img width="300"
					src="/resources/images/certi_kakao_login.png"></a></td></tr>
				</table>
				
			</c:otherwise>
		</c:choose>
	</ul>
	</div>
	
</body>
</html>

</html>
