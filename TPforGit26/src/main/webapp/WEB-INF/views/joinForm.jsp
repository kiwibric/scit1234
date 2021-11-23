<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
<script>
function memberCheck(){
	var id = document.getElementById("member_id").value;
	var pw = document.getElementById("pw").value;
	var pwCheck = document.getElementById("pwCheck").value;
	var gender = document.getElementById("gender").value;
	var phone = document.getElementById("phone").value;
	var age = document.getElementById("age").value;
	var address = document.getElementById("address").value;
	var lan1 = document.getElementById("lan1").value;
	var lan2 = document.getElementById("lan2").value;
	var lan3 = document.getElementById("lan3").value;
	var type = document.getElementById("type").value;
	var price = document.getElementById("price").value;
	var teachLan = document.getElementById("teachLan").value;
	
	if(pw == ""){
		alert("PW");
		return false;
	}else if(pw.length < 4 || pw.length > 10){
		alert("비밀번호는 4~10글자로 입력해 주세요");
		return false;
	}
	if(pw != pwCheck){
		alert("동일한 비밀번호를 입력해 주세요");
		return false;
	}
	
	if(phone == ""){
		alert("連絡先");
		return false;
	}
	if(age == ""){
		alert("年齢(10~100)");
		return false;
	}else if (age< 10 || age > 100){
		alert("年齢(10~100)");
		return false;
	}
	if(address == ""){
		alert("住所");
		return false;
	}
	if(lan1 == ""){
		alert("可能言語１");
		return false;
	}
	if(type == 0 && price==""){
		alert("선생이면 가격을 작성");
		return false;
	}
	if(type == 0 && teachLan==""){
		alert("선생이면 가르칠언어을 작성");
		return false;
	}
	
	
}

function teacherFunc(num){
	console.log(num);
	if(num == 1){
		$("#price").attr("disabled",true);
		$("#intro").attr("disabled",true);
		$("#teachLan").attr("disabled",true);
		$("#teachLan").val("선생만 활성화됨");
		$("#price").val("선생만 활성화됨");
		$("#intro").val("선생만 활성화됨");
	}else if (num == 0){
		$("#price").attr("disabled",false);
		$("#intro").attr("disabled",false);
		$("#teachLan").attr("disabled",false);
		$("#teachLan").val("");
		$("#price").val("");
		$("#intro").val("");
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

table {
	border-collapse: seperate;
	border-spacing: 0 5px;
	font-size: 15px;
}
</style>



</head>
<body>
	<div class="table-title">
		<div class="row">
			<div class="col-xs-6">
				<br>
				<h2>
					ハイ、<b>センセイ</b>
				</h2>
			</div>
		</div>
	</div>

	<form action="/join" method="post" onsubmit="return memberCheck();" style="margin-left: 20px; margin-top: 20px;">
		<table>
			<tr>
				<td><label>ID</label></td>
				<td><input type="text" id="member_id" name="member_id"
					value="${array[0] }" readonly></td>
			</tr>
			<tr>
				<td><label>PW</label></td>
				<td><input type="password" id="pw" name="pw"></td>
			</tr>
			<tr>
				<td><label>PW Check</label></td>
				<td><input type="password" id="pwCheck" name="pwCheck">
				</td>
			</tr>
			<tr>
				<td><label>性別</label></td>
				<td><select name="gender" id="gender" style="width: 170px;">
						<option value="m">男性</option>
						<option value="f">女性</option>
				</select></td>
			</tr>
			<tr>
				<td><label>連絡先</label></td>
				<td><input type="text" id="phone" name="phone"
					value="${array[2] }"></td>
			</tr>
			<tr>
				<td><label>年齢</label></td>
				<td><input type="text" id="age" name="age"></td>
			</tr>
			<tr>
				<td><label>住所</label></td>
				<td><input type="text" id="address" name="address"></td>
			</tr>
			<tr>
				<td><label>可能言語1</label></td>
				<td><input type="text" id="lan1" name="lan1"></td>
			</tr>
			<tr>
				<td><label>可能言語2</label></td>
				<td><input type="text" id="lan2" name="lan2"></td>
			</tr>
			<tr>
				<td><label>可能言語3</label></td>
				<td><input type="text" id="lan3" name="lan3"></td>
			</tr>
			<tr>
				<td><label>身分</label></td>
				<td><select name="type" id="type"
					onchange="teacherFunc(this.value);" style="width: 170px;">
						<option value="0">先生</option>
						<option value="1">学生</option>
				</select></td>
			</tr>
			<tr>
				<td><label>科目</label></td>
				<td><input type="text" id="teachLan" name="teachLan"></td>
			</tr>
			<tr>
				<td><label>時給</label></td>
				<td><input type="text" id="price" name="price"></td>
			</tr>
			<tr>
				<td><label>紹介</label></td>
				<td><input type="text" id="intro" name="intro"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="会員加入"></td>
			</tr>
		</table>
	</form>
</body>
</html>