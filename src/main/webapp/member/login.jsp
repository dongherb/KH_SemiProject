<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<link
	href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css"
	rel="stylesheet">
<title>로그인</title>
<style>
* {
	box-sizing: border-box;
	margin: 0;
	padding: 0;
	text-decoration: none;
	color: rgb(109, 109, 109);
}

@import
	url('https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&display=swap')
	;

.center {
	text-align: center;
}

.font_nanum {
	font-family: 'Nanum Gothic', sans-serif,;
}

.nomal_font {
	font-family: 'Nanum Gothic', sans-serif,;
	text-decoration: none;
	color: rgb(109, 109, 109);
	font-size: 13px;
}

.nomal_font2 {
	font-family: 'Nanum Gothic', sans-serif,;
	text-decoration: none;
	color: rgb(109, 109, 109);
	font-size: 15px;
	font-weight: 600;
	line-height: 3.3;
}

.container {
	margin: auto;
}

.navi_logo img {
	padding-top: 12px;
	padding-left: 30px;
	width: 40%;
}

.round {
	border-radius: 30px;
}

.navi_size {
	height: 50px;
	margin-top: 20px;
}

.naviBox {
	position: fixed;
	top: 10px;
	left: 0;
	right: 0;
	z-index: 1;
}

.navi_back {
	background-color: rgb(255, 255, 255, 0.8);
}

.title {
	margin-top: 8%;
	text-align: center;
	font-weight: bolder;
	font-size: 50px;
}

.main_copy {
	text-align: center;
	font-family: 'Nanum Gothic', sans-serif,;
	font-weight: bold;
	color: white
}

.main_copy2 {
	font-family: 'Nanum Gothic', sans-serif,;
	font-weight: bold;
	color: white;
	text-align: center;
}

.main_copy3 {
	text-align: center;
	font-family: 'Nanum Gothic', sans-serif,;
	font-weight: bold;
	color: white;
}

.main_gray {
	font-family: 'Nanum Gothic', sans-serif,;
	font-weight: bold;
	color: gray;
}

.text_gradation {
	font-family: 'Nanum Gothic', sans-serif,;
	font-weight: bold;
	outline: 3px white;
	background: linear-gradient(to right, rgb(234, 7, 140),
		rgb(141, 33, 190));
	color: transparent;
	-webkit-background-clip: text;
	-webkit-text-stroke-width: 0.5px;
	-webkit-text-stroke-color: white;
}

/*로그인 로고*/
.center {
	width: 15%;
	margin-top: 10%;
	margin-left: 42.5%;
	margin-right: 10%;
	margin-bottom: 1%;
}

h1 {
	text-align: center;
	font-weight: bolder;
}

.form-control {
	height: 80px;
}

#logBox {
	text-align: center;
}

#logBox img {
	width: 30%;
}

#titleBox {
	text-align: center;
}

.logo>img {
	right: 500px;
}

div {
	font-size: 13px;
	color: gray;
}

#pwbtn {
	font-size: 12px;
}

.border_Box {
	border: 1px solid black;
	border-radius: 10px;
	height: 350px;
	padding-top: 20px;
	margin: auto;
	margin-top: 35px;
}

.loginTitle {
	text-align: center;
	margin-bottom: 20px;
}

.form-control {
	height: 50px;
}

.loginBtn {
	margin-top: 30px;
	margin-left: 25%;
	width: 50%;
	height: 20%;
	font-weight: bold;
}

.search {
	text-align: center;
	margin-top: 20px;
}

.searchLinks>a {
	margin-top: 30px;
	margin-bottom: 50px;
	text-align: center;
	text-decoration: none;
	color: black;
	font-size: medium;
}

footer {
	background-color: lightgray;
	height: 180px;
	margin-top: 200px;
}

.footer_margin {
	margin-top: 50px;
	margin-bottom: 5px;
}

.footer_logo img {
	width: 100%;
}
</style>
</head>
<body>

	<c:if test="${rs eq 'fail'}">
		<script>alert("아이디 혹은 비밀번호를 잘못 입력하였습니다.");</script>
	</c:if>

	<!-- 로그인페이지 시작  -->
	<!-- 네비박스 -->
    <div class="naviBox">
        <div class="container">
            <div class="row shadow round navi_size navi_back">
                <div class="col-3 navi_logo">
                    <a href="${pageContext.request.contextPath}/home"> <img src="../images/train_logo_typo.png">    </a>   
                </div>
                <div class="col-1">
                    <span></span>
                </div>
                <div class="col-1">
                  <a href="${pageContext.request.contextPath}/toCenterSearch.cen" class="nomal_font2">센터검색</a>
                </div>
                <div class="col-1">
                  <a href="${pageContext.request.contextPath}/toWorryBoard.worrybo?currentPage=1" class="nomal_font2">고민게시판</a>
                </div>
                <div class="col-1">
                  <a href="${pageContext.request.contextPath}/toBoard.freebo?currentPage=1" class="nomal_font2">자유게시판</a>
                </div>
                <div class="col-1">
                  <a href="${pageContext.request.contextPath}/toExerciseBoard.exercisebo?currentPage=1" class="nomal_font2">운동게시판</a>
                </div>
                <div class="col-1">
                  <a href="${pageContext.request.contextPath}/toFoodBoard.foodbo?currentPage=1" class="nomal_font2">식단게시판</a>
                </div>
                <!-- 로그인 된 상태라면 로그아웃 띄우고 아니면 로그인 버튼 띄우기-->
             <c:choose>
               	<c:when test="${!empty loginSession}">
               		<div class="col-1">
                    	<a href="${pageContext.request.contextPath}/logoutProc.mem" class="nomal_font2">로그아웃</a>
                	</div>
               	</c:when>
               	<c:otherwise>
               	<div class="col-1">
                    <a href="${pageContext.request.contextPath}/toLogin.mem" class="nomal_font2">로그인</a>
                </div>
               	</c:otherwise>
            </c:choose>
                <div class="col-1">
                    <a href="${pageContext.request.contextPath}/toSignup.mem" class="nomal_font2">회원가입</a>
                </div>
                <c:if test="${!empty loginSession}">
                	<div class="col-1">
                    <a href="${pageContext.request.contextPath}/toMyPage.mem?currentPage=1" class="nomal_font2">마이페이지</a>
                </div>
                </c:if>
            </div>
        </div>
    </div>

	<div class="container-fluid point">
		<div id="carouselExampleIndicators" class="carousel slide"
			data-bs-ride="carousel">
			<div class="carousel-indicators">
				<button type="button" data-bs-target="#carouselExampleIndicators"
					data-bs-slide-to="0" class="active" aria-current="true"
					aria-label="Slide 1"></button>
				<button type="button" data-bs-target="#carouselExampleIndicators"
					data-bs-slide-to="1" aria-label="Slide 2"></button>
				<button type="button" data-bs-target="#carouselExampleIndicators"
					data-bs-slide-to="2" aria-label="Slide 3"></button>
			</div>
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img src="../images/sub_navi.png" class="d-block w-100" alt="...">
					<div class="carousel-caption d-none d-md-block">
						<h1 class="display-4 main_copy text_gradation">운동센터 가격비교 플랫폼
							휘핑</h1>
						<h1 class="display-3 main_copy"></h1>
					</div>
				</div>
				<div class="carousel-item">
					<img src="../images/sub_navi05.png" class="d-block w-100" alt="...">

					<div class="carousel-caption d-none d-md-block">
						<h1 class="display-3 main_copy2 text_gradation">당신의 무한한 가능성의
							시작</h1>
					</div>
				</div>
				<div class="carousel-item">
					<img src="../images/sub_navi06.png" class="d-block w-100" alt="...">
					<div class="carousel-caption d-none d-md-block">
						<h1 class="display-4 main_copy3 text_gradation ">운동센터의 가성비,
							가심비!</h1>
					</div>
				</div>
			</div>
			<button class="carousel-control-prev" type="button"
				data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>
	</div>

	<div class="container">
		<!--로그인 페이지 타이틀 시작-->
		<div class="loginContainer">
			<div class="row logo_title">
				<div class="col logo">
					<img class="center" src="../images/train_logo.png">
				</div>
			</div>
			<div class="row">
				<div class="col">
					<h1>휘 핑</h1>
				</div>
			</div>
		</div>
	</div>
	<!-- 첫 번째 container 끝 -->
	<!--간격-->
	<div class="row mt-4"></div>

	<form action="${pageContext.request.contextPath}/loginProc.mem"
		id="formLogin" method="post">
		<div class="container">
			<div class="row">
				<!--로그인 박스-->
				<div class="col-4 border_Box">
					<div class="row">
						<div class="col-sm-12">
							<h2 class="loginTitle">로그인</h2>
							<div class="input-group w-100">
								<span class="input-group-text" id="basic-addon1"> <svg
										xmlns="http://www.w3.org/2000/svg" width="16" height="16"
										fill="currentColor" class="bi bi-person-fill"
										viewBox="0 0 16 16">
                                                <path
											d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z" />
                                            </svg>
								</span> <input type="text" class="form-control" id="id" name="id"
									placeholder="아이디 입력" aria-label="Input group example"
									aria-describedby="basic-addon1">
							</div>

							<div class="input-group w-100">
								<span class="input-group-text" id="basic-addon1"> <svg
										xmlns="http://www.w3.org/2000/svg" width="16" height="16"
										fill="currentColor" class="bi bi-lock-fill"
										viewBox="0 0 16 16">
                                                <path
											d="M8 1a2 2 0 0 1 2 2v4H6V3a2 2 0 0 1 2-2zm3 6V3a3 3 0 0 0-6 0v4a2 2 0 0 0-2 2v5a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V9a2 2 0 0 0-2-2z" />
                                              </svg>
								</span> <input type="password" class="form-control" id="pw"
									name="password" placeholder="비밀번호 입력"
									aria-label="Input group example"
									aria-describedby="basic-addon1">
							</div>
						</div>

						<button type="button" class="btn btn-lg loginBtn" id="btnLogin"
							style="background-color: #f7e600;">로그인</button>

						<div class="search">
							<button type="button" class="btn btn-sm btn-info" id="btnSignup">회원가입</button>
						</div>
					</div>
				</div>
			</div>

		</div>
		<!-- container 끝 -->
	</form>

	<script>    
  		//로그인 버튼 클릭
		document.getElementById("btnLogin").onclick = function(){ 
			if(document.getElementById("id").value == "" || document.getElementById("pw").value == ""){
				alert("아이디 혹은 비밀번호를 입력하세요.");
				return;
			}
			document.getElementById("formLogin").submit();
		}
  		
		//일반 회원가입 버튼 클릭 시, 회원가입페이지 이동
		document.getElementById("btnSignup").addEventListener("click", function(){ 
			location.href = "${pageContext.request.contextPath}/toSignup.mem";
		});
		
		</script>
	<footer>
		<div class="container">
			<div class="row ">
				<div class="col nomal_font footer_margin"></div>
			</div>
			<div class="row">
				<div class="col-1 footer_logo">
					<img src="../images/train_logo.png">
				</div>
				<div class="col-11 nomal_font">
					(주)휘핑 | 사업자등록번호 : 1234-56-7891 | 대표 : 이동엽 | 개인정보관리자 : 김덕규 김희태 심혜인
					조현재 <br> 주소 : 서울시 송파구 마천로 30, 상가에이동 127, 128호(방이동) | 대표번호 :
					02-3472-4177 | Fax : 02-585-3083 <br> Copyright @ 2021 (주)휘핑
				</div>
			</div>
		</div>
	</footer>

</body>
</html>