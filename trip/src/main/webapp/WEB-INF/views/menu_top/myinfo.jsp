<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

</style>
<script>
	$(document).ready(function(){
		if('${SID}'){
			$('.notSession').css('display','none')
		}else{
			$('.session').css('display','none')
		}; 
		
		$('#logout').click(function(){
			$('#frm').submit();
		})
	})
</script>
</head>
<body>
<form method="POST" action="/trip/menu_top/logoutProc.tr" id="frm"></form>

<div class="w3-col mgt0 mgb60">
		<ul class="w3-col mgt0 pdt20 h50 w3-light-grey menuTop" >
			<li class="inblock w3-right mgl20 mgr50 pdr40">고객센터</li>
			<li class="inblock w3-right mgl20 mgr50">예약확인/결제</li>
			<li class="inblock w3-right mgl20 mgr50 notSession" id="join">회원가입</li>
			<li class="inblock w3-right mgl20 mgr50 notSession" id="login">로그인</li>
			<li class="inblock w3-right mgl20 mgr50 session" id="myInfo">내정보</li>
			<li class="inblock w3-right mgl20 mgr50 session" id="logout">로그아웃</li>
			<li class="inblock w3-left mgl20 mgr50 w3-text-purple" id="main"><strong>TRIP</strong></li>
		</ul>
</div>

<div class="w3-content w3-center">
	<h2 class="mgt0 mgb0 w3-border-bottom pdb20">내정보</h2>
		<div class="w3-col w3-center mgb20 w3-border pdb30 pdt60" style="width: 500px; position: relative; left: 250px; top: 100px;">
			<h6>가입일 : </h6>
			<div class="mgt50  mgb20 w3-left w3-col">
				<label class="mgr20 ">아이디:</label>
				<input type="text" class="w3-border" id="id" name="id" value="${DATA.id }" disabled>
			</div>
			<div class="mgb20 w3-col w3-left">
				<label class="mgr20">전화번호:</label>
				<input type="text" class="w3-border" style="position:relative; left:-8px;" id="tel" name="tel"value="${DATA.tel }" disabled>
			</div>
			<div class="mgb20 w3-col w3-left">
				<label class="mgr20 " >메일:</label>
				<input type="text" class="w3-border" style="position:relative; left:-8px;" id="mail" name="mail" disabled>
			</div>
			<div class="mgb20 w3-col w3-left">
				<label class="mgr20" >주소:</label>
				<input type="text" class="w3-border" style="position:relative; left:-8px;" id="addr12" name="addr12" disabled>
				<input type="text" class="w3-border" style="position:relative; left:-8px;" id="addr3" name="addr3" disabled>
			</div>
			<div class="w3-col mgt30 mgl40">
				<input type="button" onclick="" id="myinfoEdit" value="수정하기">
			</div>
		</div>
</div>
	
	
</body>
</html>