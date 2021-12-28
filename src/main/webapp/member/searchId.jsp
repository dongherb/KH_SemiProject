<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
</head>
<body>
	<style>
		*{
			text-align : center;
		}
		
		.container{
		margin:0 auto;
		width:700px;
		}
		
		
	</style>

	<div class="container">
		<h3>아이디 찾기</h3>
	  		<form id="searchIdForm" name="searchIdForm" action="${pageContext.request.contextPath}/searchIdProc.mem" method="post">
				<div class="row justify-content-center">
					<input type="text" name="name" id="name" class="form-control" placeholder="이름을 입력하세요">
		 		</div>
			<div class="row justify-content-center">
				<input type="text" name="email" id="email"class="form-control" placeholder="이메일을 입력하세요">
			</div>
			<div class="row justify-content-center">
				<button type="button" id="searchIdBtn" class= "btn btn-outline-info btn sm">검색</button>
			</div>
			</form>
	</div>
	
	<script>
    let name = document.getElementById("name").value;
    let email = document.getElementById("email").value;
    
    if(name == "" && email == ""){
       alert("모든 정보를 입력해주세요.");
       return;
    }
	
      function searchId(){
         let url = "/searchId"; // 요청 서블릿 url     
         let title ="아이디 찾기"; //윈도우 창 이름
         let status = "left=500px, top=100px, width=300px, height=200px, menubar-no, status=no, scrollbar=yes";
         
         let popup = window.open("",title,status); //빈창 오픈
         
         searchFrm.name.value=name;
         searchFrm.email.value=email;
         
         searchFrm.submit();
      }
   </script>

</body>
</html>