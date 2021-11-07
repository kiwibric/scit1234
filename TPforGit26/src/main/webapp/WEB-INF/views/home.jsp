<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>[메인화면]</title>
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
				<!-- <li><a href="${naver_url }"><img width="300" src="/resources/images/naver.png" alt="naver"></a>
				<li><a href="${google_url }"><img width="300" src="/resources/images/google.png" alt="google"></a> -->
				<br>
				<a href="javascript:kakaoLogin();"><img width="300" src="/resources/images/certi_kakao_login.png"></a>
				<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
				<script>
				window.Kakao.init("70c694b81b704b2c7e731d265ba97a3a");
				
				function kakaoLogin(){
					window.Kakao.Auth.login({
						scope:'profile_nickname, profile_image, gender, age_range',
						success: function(authObj){
							console.log(authObj);
							window.Kakao.API.request({
								url:'/v2/user/me', 
								success: res=>{
									const kakao_account = res.kakao_account;
									console.log(kakao_account);
								}
							});
						}
					});
				}
				</script>
				
			</c:otherwise>
		</c:choose>
	</ul>
</body>
</html>

</html>
