<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
<link rel="stylesheet" type="text/css" href="/trip/css/user.css">
<link rel="stylesheet" type="text/css" href="/trip/css/w3.css">
<script type="text/javascript" src="/trip/js/jquery-3.6.0.min.js"></script>

<style type="text/css">
#main{
	font-size: 20pt;
	font-style: oblique;
}
.menuTop>li {
	cursor: pointer;
}
#login {
	width: 80px;
}
#logbtn {
	cursor: pointer;
	width: 180px;
	height: 35px;
}
</style>
<script type="text/javascript">
	$(function(){
		$('#main').click(function(){
			location.href="/trip/main/main.tr";
		});
		$('#join').click(function(){
			location.href="/trip/menu_top/join.tr";
		});
	});
	
	function sub(){
		var id = $('#id').val();
		var pw = $('#pw').val();
		alert('id : ' + id+ 'pw : ' + pw)
		$('#frm').submit();
	} 

</script>
</head>
<body>

	<div class="w3-col mgt0 mgb60">
		<ul class="w3-col mgt0 pdt20 h50 w3-light-grey menuTop" >
			<li class="inblock w3-right mgl20 mgr50 pdr40">고객센터</li>
			<li class="inblock w3-right mgl20 mgr50">예약확인/결제</li>
			<li class="inblock w3-right mgl20 mgr50" id="join">회원가입</li>			
			<li class="inblock w3-right mgl20 mgr50" id="login">로그인</li>
			<li class="inblock w3-left mgl20 mgr50 w3-text-purple" id="main"><strong>TRIP</strong></li>
		</ul>
	</div> 


<form action="/trip//menu_top/loginProc.tr" method="POST" id="frm" name="frm">

	<div class="w3-content w3-center">
	<h2 class="mgt0 mgb0 w3-border-bottom pdb20">l o g i n</h2>
		<div class="w3-col w3-center mgb20 w3-border pdb30 pdt60" style="width: 500px; position: relative; left: 250px; top: 100px;">
			<div class=" mgb20 ">
				<label class="mgr20">아이디:</label>
				<input type="text" class="w3-border" id="id" name="id">
			</div>
			<div class="">
				<label class="mgr20">비밀번호:</label>
				<input type="password" class="w3-border" style="position:relative; left:-8px;" id="pw" name="pw">
			</div>
		<div class="w3-col mgt30 mgl40">
			<input type="button" onclick="sub()" id="logbtn" value="LOGIN">
		</div>
		</div>
	</div>
</form>		
</body>
</html>