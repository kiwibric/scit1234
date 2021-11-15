<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
<script>
</script>
</head>
<body>
<form action="/joinStudent" method="post"
		onclick="return memberCheck();">
		<table>
			<tr>
				<td><label>ID</label></td>
				<td><input type="text" id="member_id" name="member_id" value="${array[0] }" disabled>
				</td>
			</tr>
			<tr>
				<td><label>비밀번호</label></td>
				<td><input type="password" id="member_pw" name="member_pw">
				</td>
			</tr>
			<tr>
				<td><label>비밀번호 확인</label></td>
				<td><input type="password" id="pwCheck" name="pwCheck">
				</td>
			</tr>
			<tr>
			
				<td><label>남성</label> <input type="radio" id="member_gender"
					name="member_gender"> <label>여성</label> <input type="radio"
					id="member_gender" name="member_gender"></td>
			</tr>
			<tr>
				<td><label>연락처</label></td>
				<td><input type="text" id="phone" name="phone" value="${array[3] }">
				</td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="회원가입"></td>
			</tr>
		</table>
	</form>
${array[0] }
${array[1] }
${array[2] }
${array[3] }
${array[4] }
</body>
</html>