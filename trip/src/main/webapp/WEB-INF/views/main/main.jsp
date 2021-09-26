<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html >
<head>
<meta charset="UTF-8">
<title>Enjoy Your Trip!</title>
<link rel="stylesheet" type="text/css" href="/trip/css/user.css">
<link rel="stylesheet" type="text/css" href="/trip/css/w3.css">
<script type="text/javascript" src="/trip/js/jquery-3.6.0.min.js"></script>
<style type="text/css">
#main{
	font-size: 20pt;
	font-style: oblique;
}
img {
	width: 800px;
	height: 500px;
}
.menuTop>li {
	cursor: pointer;
}
#login {
	width: 80px;
}

</style>
<script type="text/javascript">
	$(document).ready(function(){
		$('#login').click(function(){
			$('#frm').submit();
		});
		$('#logout').click(function(){
			$('#frm1').submit();
		});
		$('#myinfo').click(function(){
			$('#frm2').submit();
		})
		
		
		$(function(){
			$('#main').click(function(){
				location.href='/trip/main/main.tr';
			});
			$('#join').click(function(){
				location.href='/trip/menu_top/join.tr';
			});
			$('#myInfo').click(function(){
				location.href="/trip/menu_top/myinfo.tr";
			})
		});
		
		if('${SID}'){
			$('.notSession').css('display','none')
		}else{
			$('.session').css('display','none')
		}; 
	});
	
</script>
</head>
<body>

<form method="POST" action="/trip/menu_top/login.tr" id="frm"></form>
<form method="POST" action="/trip/menu_top/logoutProc.tr" id="frm1"></form>
<form method="POST" action="/trip/menu_top/myinfo.tr" id="frm2" ></form>

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
	<ul class="w3-content mxw1100 ">
		<li class="inblock w3-button w3-hover-light-grey mgl60">해외여행</li>
		<li class="inblock w3-button w3-hover-light-grey mgl60">국내/제주</li>
		<li class="inblock w3-button w3-hover-light-grey mgl60">항공</li>
		<li class="inblock w3-button w3-hover-light-grey mgl60">호텔</li>
		<li class="inblock w3-button w3-hover-light-grey mgl60">투어</li>
		<li class="inblock w3-button w3-hover-light-grey mgl60">입장권</li>
	</ul>
	<div class="w3-content mgt60">
			<img src="/trip/img/img01.jpg" alt="img01" style="position:relative; left:80px;" class="mgb20" id="mainImage">
	</div>
		
		
<script>
	var myImage=document.getElementById("mainImage")
	var imageArray=["/trip/img/img01.jpg","/trip/img/img02.jpg","/trip/img/img03.jpg","/trip/img/img04.jpg","/trip/img/img05.jpg"]
	var imageIndex=0;
	
	function changeImage(){
		myImage.setAttribute("src",imageArray[imageIndex]);
		imageIndex++;
		if(imageIndex>=imageArray.length){
			imageIndex=0;
		}
	}
setInterval(changeImage,3000);
</script>		
</body>
</html>