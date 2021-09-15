<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head> <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript"  src="/choi/js/jquery-3.6.0.min.js"></script>
<%

String inputYn = request.getParameter("inputYn"); 
String roadFullAddr = request.getParameter("roadFullAddr"); 
String roadAddrPart1 = request.getParameter("roadAddrPart1"); 
String roadAddrPart2 = request.getParameter("roadAddrPart2"); 
String engAddr = request.getParameter("engAddr"); 
String jibunAddr = request.getParameter("jibunAddr"); 
String zipNo = request.getParameter("zipNo"); 
String addrDetail = request.getParameter("addrDetail"); 


%>
</head>
<script type="text/javascript">

function init(){
var url = location.href;
var confmKey = "devU01TX0FVVEgyMDIxMDkxNDIzMTY0NzExMTY2NTY="; 
var resultType ="2";  
var inputYn= "<%=inputYn%>";
if(inputYn != "Y"){
 document.form.confmKey.value = confmKey;
 document.form.returnUrl.value = url;
 document.form.resultType.value = resultType;
 document.form.action="https://www.juso.go.kr/addrlink/addrLinkUrl.do"; 
 
 document.form.submit();
}else{
opener.jusoCallBack("<%=roadAddrPart1%>","<%=addrDetail%>","<%=zipNo%>");
window.close();
}
}
</script>
<body onload='init();'>
<form id="form" name="form" method="post">
<input type="hidden" id="confmKey" name="confmKey" value=""/>
<input type="hidden" id="returnUrl" name="returnUrl" value=""/>
<input type="hidden" id="resultType" name=" resultType " value=""/>
</form> 
</body>
</html>