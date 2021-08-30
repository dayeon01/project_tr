<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join</title>
<link rel="stylesheet" type="text/css" href="/trip/css/user.css">
<link rel="stylesheet" type="text/css" href="/trip/css/w3.css">
<script type="text/javascript" src="/trip/js/jquery-3.6.0.min.js"></script>

<style type="text/css">
#main{
	font-size: 20pt;
	font-style: oblique;
}
#login {
	width: 80px;
}
.menuTop>li {
	cursor: pointer;
}
#jbtn {
	width: 500px;
	height: 50px;
	position: relative;
	left: 100px;
	margin-bottom: 150px;
	font-size: 20pt;
	cursor: pointer;
}
small{
	position: relative;
	left: 130px;
}
input[type="button"]{
	cursor: pointer;
}
label{
	font-weight: bold;
}
</style>
<script type="text/javascript">
	$(document).ready(function(){
		$('.ms').css("display","none");
		
		$('#main').click(function(){
			$('#frm').submit();
		});
		$('#join').click(function(){
			location.href="/trip/menu_top/join.tr";
		});
		$('#login').click(function(){
			location.href="/trip/menu_top/login.tr";
		});
	});

</script>
</head>
<body>
<form method="POST" action="/trip/main/main.tr" id="frm"></form>

	<div class="w3-col mgt0 mgb60">
		<ul class="w3-col mgt0 pdt20 h50 w3-light-grey menuTop" >
			<li class="inblock w3-right mgl20 mgr50 pdr40">고객센터</li>
			<li class="inblock w3-right mgl20 mgr50">예약확인/결제</li>
			<li class="inblock w3-right mgl20 mgr50" id="join">회원가입</li>
			<li class="inblock w3-right mgl20 mgr50" id="login">로그인</li>
			<li class="inblock w3-left mgl20 mgr50 w3-text-purple" id="main"><strong>TRIP</strong></li>
		</ul>
	</div>
	
	<div class="w3-content ">
		<div class="mgt0 mgb60 mgl60 ">
			<div class="mgt60 mgb20 w3-col">
				<label class="mgr60">이름:</label>
				<input type="text" class="w3-border" id="name">
			</div>
			<div class="mgt10 mgb20 w3-col">
				<label class="mgr30">주민번호:</label>
				<input type="text" class="w3-border" id="resi">
			</div> 
			<div class="mgt10 mgb30 w3-col">
				<label class="mgr50">아이디:</label>
				<input type="text" class="w3-border" id="id">
				<input type="button" class="w3-border check" value="중복확인" id="idCheck">
			</div>
				<div class="w3-text-red ms" id="idX"><small>이미 사용중인 아이디입니다.</small></div>
				<div class="w3-text-green mgb10  ms" id="idO"><small>사용 가능한 아이디입니다.</small></div>
			<div class="w3-col">
				<label class="mgt10 mgr40 mgb30">비밀번호:</label>
				<input type="password" class="w3-border" style="position:relative; left:-8px;" id="pw">
			</div>
			<div class="w3-col mgt20 mgb30">
				<label class="mgr10">비밀번호 확인:</label>
				<input type="password" class="w3-border" style="position:relative; left:-8px;" id="pwCheck">
			</div>
			<div class="w3-text-red ms" id="pwX"><small>비밀번호가 일치하지 않습니다.</small></div>
			<div class="w3-text-green ms" id="pwO"><small>비밀번호가 일치합니다.</small></div>
			<div class="mgt10 mgb20 w3-col">
				<label class="mgr50">이메일:</label>
				<input type="email" class="w3-border" id="email">
			</div>
			<div class="mgt10 mgb10 inblock">
				<label class="mgr60">주소:</label>
				<input type="text" class="w3-border" id="add">
			</div>
			<div class=" mgl10 mgb20 inblock">
				<label class="mgr10">상세주소:</label>
				<input type="text" class="w3-border" id="add2">
			</div>
			<div class="mgt10 mgb20 w3-col">
				<label class="mgr30">전화번호:</label>
				<input type="text" class="w3-border" id="tel">
				<input type="button" class="w3-border check" value="인증하기" id="telCheck">
			</div>
		</div>
		<div class="inblock mgl60 mgt20">
			<input type="button" id="jbtn" value="JOIN">
		</div>
	</div>
</body>
</html>