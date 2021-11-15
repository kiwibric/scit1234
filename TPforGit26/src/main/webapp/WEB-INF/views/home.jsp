<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>[메인화면]</title>
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
window.Kakao.init("70c694b81b704b2c7e731d265ba97a3a");

function kakaoLogin(){
	window.Kakao.Auth.login({
		//redirectUri: 'http://localhost:8888/joinForm/',
		scope:'profile_nickname, birthday, gender, account_email, profile_image',
		success: function(authObj){
			console.log(authObj);
			window.Kakao.API.request({
				url:'/v2/user/me', 
				success: res=>{//각각의 테이블에 접근해서 중복확인 후 처리
					const kakao_account = res.kakao_account;
					console.log(kakao_account.email);
					var userNick = kakao_account.profile.nickname;
					var birthday = kakao_account.birthday;
					var gender = kakao_account.gender;
					var email = kakao_account.email;
					var image = kakao_account.profile_image;
					var check = 0;
					$.ajax({
						url : "/tcCheck",
						type : "get",
						dataType : "json",
						data : {
							"userNick" : userNick
						},
						success : function(data) {
							console.log("server data : " + data);
							if (data == true){
								location.replace("/teacherMypage");
							}
							
						},
						error : function(e) {
							console.log(e);
						}
					});
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
								location.replace("/joinForm?userNick="+userNick+"&birthday="+birthday+"&gender="+gender+"&email="+email+"&image="+image);
							}
							
						},
						error : function(e) {
							console.log(e);
						}
					});
					console.log(kakao_account);
					console.log(kakao_account.profile.nickname);
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
</head>
<body>
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
				<li><a href="loginForm">로그인</a></li>
				<li><a href="joinForm">join</a></li>
				<!-- <li><a href="${naver_url }"><img width="300" src="/resources/images/naver.png" alt="naver"></a>
				<li><a href="${google_url }"><img width="300" src="/resources/images/google.png" alt="google"></a> -->
				<br>
				<a href="javascript:kakaoLogin();"><img width="300"
					src="/resources/images/certi_kakao_login.png"></a>
				<li onclick="kakaoLogout();"><a href="javascript:void(0)">
						<span>카카오 로그아웃</span>
				</a></li>


			</c:otherwise>
		</c:choose>
	</ul>
</body>
</html>

</html>
