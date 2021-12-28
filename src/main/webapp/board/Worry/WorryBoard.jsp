<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link
	href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css"
	rel="stylesheet">
<title>고민 게시글 목록</title>
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

.container {
	padding: 0px;
}

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

th, td {
	text-align: center;
}

a{
text-decoration:none;
color:black;
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

.boardTitle>th {
	color: black;
	font-weight: bold;
}

.pLeft {
	margin-left: 40%;
}

.pRight {
	margin-left: 10%;
}

#btn_write {
	margin-left: 90%;
	margin-bottom: 1%;
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

.imgaling {
	text-align: right;
}
</style>
</head>
<body>
	<!-- 네비박스 -->
    <div class="naviBox">
        <div class="container">
            <div class="row shadow round navi_size navi_back">
                <div class="col-3 navi_logo">
                    <a href="${pageContext.request.contextPath}/home"> <img src="images/train_logo_typo.png">    </a>   
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
					<img src="../../images/sub_navi.png" class="d-block w-100" alt="...">
					<div class="carousel-caption d-none d-md-block">
						<h1 class="display-4 main_copy text_gradation">운동센터 가격비교 플랫폼 휘핑</h1>
						<h1 class="display-3 main_copy"></h1>
					</div>
				</div>
				<div class="carousel-item">
					<img src="../../images/sub_navi05.png" class="d-block w-100"
						alt="...">

					<div class="carousel-caption d-none d-md-block">
						<h1 class="display-3 main_copy2 text_gradation">당신의 무한한 가능성의
							시작</h1>
					</div>
				</div>
				<div class="carousel-item">
					<img src="../../images/sub_navi06.png" class="d-block w-100"
						alt="...">
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
		<div class="row">
			<div class="col-12 mb-5 d-flex justify-content-center">
				<div class="title">고민 게시판</div>
			</div>
		</div>

		<br>
		<div class="row">
			<div class="col btnWriteDiv">
				<button type="button" class="btn btn-primary" id="btn_write">글 작성</button>
				<c:choose>
					<c:when test="${empty loginSession}">
					<script>
						$("#btn_write").on("click",function(){
							alert("로그인이 필요한 기능입니다.");
							location.href="${pageContext.request.contextPath}/";
						})
					</script>
				</c:when>
				<c:otherwise>
				<script>
					$("#btn_write").on("click",function(){
						location.href="${pageContext.request.contextPath}/toWorryWrite.worrybo";
					})
				</script>
				</c:otherwise>
			</c:choose>
			</div>
		</div>
	</div>


	<div class="row">
		<div class="col">
			<div class="panel panel-info pLeft">
				<img src="../../images/150x400.png" class="d-block">
			</div>
		</div>

		<div class="col-md-8">
			<div class="container">
				<table class="table table-bordered">
					<thead>
						<tr class="boardTitle">
							<th class="col-md-1">게시판 구분</th>
							<th class="col-md-5">제목</th>
							<th class="col-md-2">작성자</th>
							<th class="col-md-2">작성일</th>
							<th class="col-md-1">조회수</th>
							<th class="col-md-1">추천수</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="dto">
							<tr>
								<td>${dto.getBoard_category()}</td>
								<td><a
									href="${pageContext.request.contextPath}/toWorryDetailView.worrybo?board_seq=${dto.getBoard_seq()}&currentPage=${naviMap.get('currentPage')}">${dto.getBoard_title()}</a></td>
								<td>${dto.getWriter_nickname()}</td>
								<td>${dto.getWritten_date()}</td>
								<td>${dto.getView_count()}</td>
								<td>${dto.getRecommended_count()}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>

		<div class="col">
			<div class="panel panel-info pRight">
				<img src="../../images/150x300.png" class="d-block"> 
				<img src="../../images/150x200.png" class="d-block">
			</div>
		</div>
	</div>

	<div class="row">
		<nav class="col" aria-label="Page navigation example">
			<ul class="pagination justify-content-center">
				<c:if test="${naviMap.get('needPrev') eq true}">
					<li class="page-item"><a class="page-link"
						href="${pageContext.request.contextPath}/toWorryBoard.worrybo?currentPage=${naviMap.get('startNavi')-1}">Previous</a></li>
				</c:if>
				<!--startNavi ->endNavi  -->
				<c:forEach var="i" begin="${naviMap.get('startNavi')}"
					end="${naviMap.get('endNavi')}">
					<li class="page-item"><a class="page-link"
						href="${pageContext.request.contextPath}/toWorryBoard.worrybo?currentPage=${i}">${i}</a></li>
				</c:forEach>
				<c:if test="${naviMap.get('needNext') eq true}">
					<li class="page-item"><a class="page-link"
						href="${pageContext.request.contextPath}/toWorryBoard.worrybo?currentPage=${naviMap.get('endNavi')+1}">Next</a></li>
				</c:if>
			</ul>
		</nav>
	</div>
	</div>

	<footer>
		<div class="container">
			<div class="row ">
				<div class="col nomal_font footer_margin"></div>
			</div>
			<div class="row">
				<div class="col-1 footer_logo">
					<img src="../../images/train_logo.png">
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

