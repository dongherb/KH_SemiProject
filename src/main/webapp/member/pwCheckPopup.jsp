<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<title>비밀번호 확인</title>
</head>
 <style>
	.inputPW{
	margin-top:75px;
	}
	.result{
	margin-top:-50px;
	}	
	.btn2{
	margin-top:-50px;
	}
 </style>
<body>
	
	<form action="/pwCheckProc.mem" method="post" id="checkForm">
		<div class="container">
			<div class="row p-4 d-flex justify-content-center inputPW">
				<div class="col-8 mb-4">
					<input type="password" id="pwInput" class="form-control"
						placeholder="비밀번호를 입력하세요." name="pwInput" value="">
           		</div>
				
			</div>
			
			<div class="row p-4 result">
				<div class="col mb-4">			
					<input type="hidden" id="rs" value="${rs}">				
				</div>
			</div>
		
			<div class="row p-4 justify-content-center btn2">
				<div class="col-4 d-flex justify-content-end">
					<button type="button" id="btnCancel" class="btn btn-secondary w-100">창닫기</button>
				</div>
				<div class="col-4 d-flex justify-content-start">
					<button type="button" id="btnCheck" class="btn btn-warning w-100">비밀번호 확인</button>
				</div>	
			</div>
		</div>
	</form>
	
	<script>
	let rs = document.getElementById("rs");
	let btnCancel = document.getElementById("btnCancel");
	let pwInput = document.getElementById("pwInput");
	
	//비밀번호확인 버튼 클릭
	btnCheck.addEventListener("click", function(){
		document.getElementById("checkForm").submit();
		
	});
		
	//팝업창 닫힘
	btnCancel.addEventListener("click", function(){
		self.close();
	})
		
	//rs값(비밀번호) 체크
	if(rs.value == "true"){
		opener.modifyView();
		self.close();
	}else if(rs.value == "false"){
		alert("비밀번호를 확인해주세요")
	}
	

</script>
</body>
</html>