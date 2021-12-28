<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- jquery 태그 -->
<script
  src="https://code.jquery.com/jquery-3.6.0.js"
  integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
  crossorigin="anonymous"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<title>사업자번호 중복 확인</title>
</head>
 <style>
	.inputBn{
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
	<!-- 로그인 ON 페이지("/idCheckProc.mem") -->
	<form action="/bnCheckProc.mem" method="post" id="checkForm">
		<div class="container">
			<div class="row p-4 inputBn">
				<div class="col-8 mb-4">
					<input type="text" maxlength ="10" id="bnInput" class="form-control"
						placeholder="사업자번호를 입력하세요." name="bnInput" value="${bnInput}">
           		</div>
				<div class="col-4 mb-4">
					<button type="button" id="btnCheck" class="btn btn-warning w-100">사업자번호 확인</button>
				</div>
			</div>
			
			<div class="row p-4 result">
				<div class="col mb-4">
					<h6>확인 결과 :</h6>
					
					<c:if test="${rs eq 'available'}">
						<p id="rs">사용 가능한 사업자번호입니다.</p>
					</c:if>
					<c:if test="${rs eq 'unavailable'}">
						<p id="rs">사용 불가한 사업자번호입니다.</p>
					</c:if>
				</div>
			</div>
		
			<div class="row p-4 justify-content-center btn2">
				<div class="col-4 d-flex justify-content-end">
					<button type="button" id="btnCancel" class="btn btn-secondary">창닫기</button>
				</div>
				<div class="col-4 d-flex justify-content-start">
					<button type="button" id="btnSubmit" class="btn btn-primary" disabled>사용</button>
				</div>
			</div>
		</div>
	</form>
	
	<script>
	let rs = document.getElementById("rs");
	let btnSubmit = document.getElementById("btnSubmit");
	let btnCancel = document.getElementById("btnCancel");
	let bnInput = document.getElementById("bnInput");
	let btnCheck = document.getElementById("btnCheck");
	
	//정규식
	let regexBusiness_no = /^[0-9]{10}/;
	
	//중복확인 버튼 클릭
	btnCheck.addEventListener("click", function(){
		
		if(!regexBusiness_no.test(bnInput.value) || bnInput.value == ""){
			alert("사업자번호를 형식에 맞게 입력하세요. (반드시 숫자 10자리)");
			return;
		}
		document.getElementById("checkForm").submit();
	});
		
	//팝업창 닫힘
	btnCancel.addEventListener("click", function(){
		self.close();
	})
	
	//사용 버튼 클릭
	btnSubmit.addEventListener("click", function(){
		opener.document.getElementById("business_no").value = bnInput.value;
		self.close();
	});
		
	
	if(rs.innerHTML == "사용 가능한 사업자번호입니다."){
		rs.style.color = "green";
		$("#btnSubmit").removeAttr("disabled");
	}else{
		rs.innerHTML == "사용 불가능한 사업자번호입니다.";
		rs.style.color = "red";
	}	
	

</script>
</body>
</html>