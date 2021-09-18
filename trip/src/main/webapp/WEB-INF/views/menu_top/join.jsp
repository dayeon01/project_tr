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
			$('#main').submit();
		});
		$('#join').click(function(){
			location.href="/trip/menu_top/join.tr";
		});
		$('#login').click(function(){
			location.href="/trip/menu_top/login.tr";
		});
	/* 	$('#jbtn').click(function(){
			<!-- var id = $('#id').prop('value'); -->
			var id = $('#id').val();
			var name = $('#name').val();
			var resi = $('#resi').val();
			var pw = $('#pwCheck').val();
			var email = $('#email').val();
			var addr1 = $('#addr1').val();
			var addr2 = $('#addr2').val();
			var addr3 = $('#addr3').val();
			var tel = $('#tel').val();
			alert(id+name+resi+pw+email+addr1+addr2+addr3+tel);
		}); */
		
		
		
		
		//id 정규표현식
		function idCheck(){
			var id = $('#id').val();
			var idCk = /^[A-za-z0-9]{5,15}$/g;
			return idCk.test(id);
		};
		//id 이벤트
		$('#id').keyup(function(){
			 if(idCheck()){
				 $('#idmsg').removeClass('w3-text-red').addClass('w3-text-orange').html('형식에 맞는 아이디입니다. 중복체크를 해주세요.');
			}else {
				 $('#idmsg').removeClass('w3-text-green').addClass('w3-text-red').html('특수문자를 제외한 영문,숫자 5~15자 내외로 작성해주세요.');
			}  
		})
		
			//id중복검사 ajax
		$('#idCheck').click(function(){
			var check = 0;
			var request =$.ajax({
				url: "/trip/menu_top/ukCheck.tr",
				method:"POST",
				data:{len: $('#id').val()},
				dataType: "json"
			});
			
		request.done(function(data){
				console.log(data);
			if(data != undefined && data !=''){
				if(data.result = "Y"){
					alert('사용 가능한 아이디 입니다.');
					check++;
				}else{
					alert('사용 불가능한 아이디 입니다.');
				}
			}
		});
		
		request.fail(function(jqXHR, textStatus, error){
			  alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error)

		});
	});
		//pw 정규표현식
			function pwCheck(){
			var pw = $('#pw').val();
			// : 숫자, 특문 각 1회 이상, 영문은 2개 이상 사용하여 8자리 이상 15자리 이하
		    var pwCk = /(?=.*\d{1,50})(?=.*[~`!@#$%\^&*()-+=]{1,50})(?=.*[a-zA-Z]{2,50}).{8,15}$/;
		    return pwCk.test(pw);
		}
		
		$('.pwmsg').css('display','none');
		
		//pw 이벤트
		$('.password').keyup(function(){
			var pw = $('#pw').val();
			var pwCk = $('#pwCheck').val();
			if(pw == '' && pwCk == ''){
				null;
			}else if(pw != '' || pwCk != ''){
					if(pw == pwCk){
						$('#pwO').css('display','inline-block');
						$('#pwX').css('display','none')
					} else{
						$('#pwX').css('display','inline-block');
						$('#pwO').css('display','none');
					}
				}
		})
	
		
		//주민번호 이밴트
		$('#resi').keyup(function(){
			var selection = window.getSelection().toString();
			if(selection !== ''){
				return;
			}
			var resi = $(this).val();
			res = resi.replace(/-/g,'').replace(/(\d{6})(\d{7})/g, '$1-$2');
			$(this).val(res);
		})
		
		
		//주소 팝업창 오픈
 		$('#addrBtn').click(function goPopup(){
 			var pop = window.open("/trip/popup/jusoPopup.tr","pop","width=570,height=420, scrollbars=yes, resizable=yes");	
 		});
		
		//전화번호 이벤트
		
		$('#tel').keyup(function(){
		
 		 	var selection = window.getSelection().toString();
 		    if ( selection !== '' ) {
 		        return;
 		    }
 			var phone = $(this).val()
 			
 			res = phone.replace(/-/g, '').replace(/(\d{2,3})(\d{3,4})(\d{4})/g, '$1-$2-$3');
 			$(this).val(res); 
		})
		
		
	
		
		
	});
	//test
	function submit(){
		var id = $('#id').val();
		var name = $('#name').val();
		var resi = $('#resi').val();
		var pw = $('#pwCheck').val();
		var email = $('#email').val();
		var addr1 = $('#addr1').val();
		var addr2 = $('#addr2').val();
		var addr3 = $('#addr3').val();
		var tel = $('#tel').val();
		alert(id+name+resi+pw+email+addr1+addr2+addr3+tel);
		
		if($('#id').val() == ''){
			alert('아이디를 입력하세요.');
			return;
		}else if($('#name').val() == ''){
			alert('이름을 입력하세요.');
			return;
		}else if($('#resi').val() == ''){
			alert('주민번호를 입력하세요');
			return;
		}else if($('#pw').val() == ''){
			alert('비밀번호를 입력하세요');
			return;
		}else if($('#pwCheck').val() == ''){
			alert('비밀번호 확인을 입력하세요');
			return;
		}else if($('#email').val() == ''){
			alert('이메일을 입력하세요');
			return;
		}else if($('#emailAdd option:selected').length == 0){
			alert('메일 주소를 선택해주세요.');
			return;
		}else if($('.addr').val() == ''){
			alert('주소를 입력하세요.');
			return;
		}else if($('#tel').val() == ''){
			alert('전화번호를 입력하세요.');
			return;
		}else{
			alert('회원가입 완료');
		}
	};
	
	
	function jusoCallBack(roadAddrPart1,addrDetail, zipNo){
		$('#addr1').val(zipNo);
		$('#addr2').val(roadAddrPart1);
		$('#addr3').val(addrDetail);
	}
</script>
</head>
<body>
<form method="POST" action="/trip/main/main.tr" id="main"></form>

	<div class="w3-col mgt0 mgb60">
		<ul class="w3-col mgt0 pdt20 h50 w3-light-grey menuTop" >
			<li class="inblock w3-right mgl20 mgr50 pdr40">고객센터</li>
			<li class="inblock w3-right mgl20 mgr50">예약확인/결제</li>
			<li class="inblock w3-right mgl20 mgr50" id="join">회원가입</li>
			<li class="inblock w3-right mgl20 mgr50" id="login">로그인</li>
			<li class="inblock w3-left mgl20 mgr50 w3-text-purple" id="main"><strong>TRIP</strong></li>
		</ul>
	</div>
<form action="/joinProc.tr" method="post" id="frm" name="frm">
	
	<div class="w3-content">
		<div class="mgt0 mgb60 mgl60 ">
			<div class="mgt60 mgb20 w3-col">
				<label class="mgr60">이름:</label>
				<input type="text" class="w3-border" id="name">
			</div>
			<div class="mgt10 mgb20 w3-col">
				<label class="mgr30">주민번호:</label>
				<input type="text" class="w3-border" id="resi" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
			</div> 
			<div class="mgt10 mgb20 w3-col">
				<label class="mgr50">아이디:</label>
				<input type="text" class="w3-border" id="id">
				<input type="button" class="w3-border check" value="중복확인" id="idCheck">
			</div>
				<p class="mgl60 mgt0 mgb20" id="idmsg"></p>
			<div class="w3-col">
				<label class="mgt10 mgr40 mgb30">비밀번호:</label>
				<input type="password" class="w3-border password" style="position:relative; left:-8px;" id="pw">
				<span class="w3-text-grey">숫자, 특수문자 1회 이상, 영문은 2개 이상 사용하여 8~15자리 이하로 작성하십쇼.</span>
			</div>
			<div class="w3-col mgt20 mgb10">
				<label class="mgr10">비밀번호 확인:</label>
				<input type="password" class="w3-border password" style="position:relative; left:-8px;" id="pwCheck">
			</div>
			
			<div class="w3-col ">
				<label class="w3-text-green pwmsg" id="pwO"><small>비밀번호가 일치합니다.</small></label>
				<label class="w3-text-red pwmsg" id="pwX"><small>비밀번호가 일치하지 않습니다.</small></label>
			</div>
			
			
			<div class="mgt10 mgb20 inblock">
				<label class="mgr50">이메일:</label>
				<input type="email" class="w3-border" id="email">
				<label >@</label>
				<select name="emailAdd" id="emailAdd">
					<option value="">이메일 선택</option>
					<option value="01">naver.com</option>
					<option value="02">hanmail.net</option>
					<option value="03">daum.net</option>
					<option value="04">google.com</option>
					<option value="05">gmail.com</option>
				</select>
			</div>
			<div class="mgt10 mgb10 ">
				<label class="mgr10">주소:</label>
				<input type="text" name="addr1"class="w3-border mgl50 addr"  id="addr1">
				<input type="button" value="우편번호" id="addrBtn" placeholder="우편번호">
			</div>
			<div class="mgt10 mgb10 mgl60 pdl40">
				<input type="text" name="addr2" class="w3-border addr" id="addr2">
				<input type="text" name="addr3" class="w3-border addr" id="addr3">
			</div>
			<div class="mgt10 mgb20 w3-col">
				<label class="mgr30">전화번호:</label>
				<input type="text" class="w3-border" id="tel" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
			</div>
		</div>
		<div class="inblock mgl60 mgt20">
			<input type="button" onclick="submit()" id="jbtn" value="JOIN">
		</div>
	</div>
</form>	
</body>
</html>