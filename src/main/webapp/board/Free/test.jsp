<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<button type="button" id="freetest">자유 게시판 테스트</button>
	<button type="button" id="worrytest">고민 게시판 테스트</button>
	<button type="button" id="foodtest">식단 게시판 테스트</button>
	<button type="button" id="exercisetest">운동 게시판 테스트</button>
	   <a href="https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=2d4ac180ad6ea3f67c6cfbe9d55448bc&redirect_uri=https%3A%2F%2Fwww%2Edietshin%2Ecom%2Fmember%2Fkakao%2Easp&state=1638540174_191512">
	   <img src="/images/arrowTop.png">
	   </a>
	 
	 
	<script>
		let freetest = document.getElementById("freetest");
		freetest.addEventListener("click",function(){
			location.href="${pageContext.request.contextPath}/toBoard.freebo?currentPage=1";
		})
		
		let worrytest = document.getElementById("worrytest");
		worrytest.addEventListener("click",function(){
			location.href="${pageContext.request.contextPath}/toWorryBoard.worrybo?currentPage=1";
		})
		
		let foodtest = document.getElementById("foodtest");
		foodtest.addEventListener("click",function(){
			location.href="${pageContext.request.contextPath}/toFoodBoard.foodbo?currentPage=1";
		})
		
		let exercisetest = document.getElementById("exercisetest");
		exercisetest.addEventListener("click",function(){
			location.href="${pageContext.request.contextPath}/toExerciseBoard.exercisebo?currentPage=1";
		})
		
		
	</script>
</body>
</html>