<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<title>로그인 버튼</title>
</head>
<body>
		<div>
			<button type="button" id="btnLogin" class="btn btn-warning">로그인하러가기</button>
		</div>
    
	<script>
		document.getElementById("btnLogin").onclick=function(){
			location.href="${pageContext.request.contextPath}/toLogin.mem";
		}
	</script>
</body>
</html>