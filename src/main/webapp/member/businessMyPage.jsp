<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<title>사업자회원 :: 마이페이지</title>
<style>
/*	*{box-sizing: border-box}
    	input {
    		background-color : transparent;
    	} 
    	*/
.cls-after {
	display: none;
}

.../
imagesize {
	width: 100px;
	height: 100px
}

* {
	border: 0px solid black;
}

.category {
	border-right: 1px solid black;
}

.title {
	text-align: center;
	border-right: 1px solid black;
}

.boardBoxBox {
	text-align: center;
}

/*	*{box-sizing: border-box}
    	input {
    		background-color : transparent;
    	} 
    	*/
.cls-after {
	display: none;
}

* {
	border: 0px solid black;
}

.category {
	border-right: 1px solid black;
}

.title {
	text-align: center;
	border-right: 1px solid black;
}

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

.nomal_font3 {
	font-family: 'Nanum Gothic', sans-serif,;
	text-decoration: none;
	color: rgb(109, 109, 109);
	font-size: 19px;
	font-weight: 500;
}

label {
	font-family: 'Nanum Gothic', sans-serif,;
	text-decoration: none;
	color: rgb(109, 109, 109);
	font-size: 14px;
	font-weight: 500;
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

.gab {
	margin-top: 50px;
	margin-bottom: 50px;
}

.gab_small {
	margin-top: 40px;
	margin-bottom: 10px;
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
}

.text_gradation3 {
	text-align: center;
	font-family: 'Nanum Gothic', sans-serif,;
	font-weight: bold;
	font-size: 25px;
	background: linear-gradient(to right, rgb(234, 7, 140),
		rgb(141, 33, 190));
	color: transparent;
	-webkit-background-clip: text;
}

.text_gradation_outline {
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

.text_gradation_blue {
	font-family: 'Nanum Gothic', sans-serif,;
	font-weight: bold;
	outline: 3px white;
	background: linear-gradient(to right, rgb(33, 204, 254), rgb(0, 23, 97));
	color: transparent;
	-webkit-background-clip: text;
}

.center_img img {
	margin-top: 50px;
	width: 30%;
}

.img_center {
	text-align: center;
}

.t_center {
	padding-top: 8px;
	line-height: 1;
}

.border {
	border: 1px solid black;
}

.inner_padding {
	padding-right: 15px;
}

.bg_color {
	background-color: burlywood;
}

.center_name {
	font-family: 'Nanum Gothic', sans-serif,;
	font-weight: bold;
	color: gray;
	font-size: 25px;
}

.gab {
	margin-top: 50px;
	margin-bottom: 30px;
}

.text_center {
	text-align: center;
}

.text_list {
	font-family: 'Nanum Gothic', sans-serif,;
	text-align: left;
	font-size: 15px;
	color: black;
}

.copy_margen {
	margin-top: 50px;
}

.bag_ivory {
	background-color: beige;
	height: auto;
}

footer {
	background-color: lightgray;
	height: 250px;
}

.footer_margin {
	margin-top: 50px;
	margin-bottom: 10px;
}

.footer_logo img {
	width: 50%;
}

.imgaling {
	text-align: right;
}

.businessImg>img {
	width: 300px;
	height: 300px;
}
</style>
</head>
<body>
	<!-- 네비박스 -->
	<div class="naviBox">
		<div class="container">
			<div class="row shadow round navi_size navi_back">
				<div class="col-3 navi_logo">
					<a href="${pageContext.request.contextPath}/home"> <img
						src="../images/train_logo_typo.png">
					</a>
				</div>
				<div class="col-1">
					<span></span>
				</div>
				<div class="col-1">
					<a href="${pageContext.request.contextPath}/toCenterSearch.cen"
						class="nomal_font2">센터검색</a>
				</div>
				<div class="col-1">
					<a
						href="${pageContext.request.contextPath}/toWorryBoard.worrybo?currentPage=1"
						class="nomal_font2">고민게시판</a>
				</div>
				<div class="col-1">
					<a
						href="${pageContext.request.contextPath}/toBoard.freebo?currentPage=1"
						class="nomal_font2">자유게시판</a>
				</div>
				<div class="col-1">
					<a
						href="${pageContext.request.contextPath}/toExerciseBoard.exercisebo?currentPage=1"
						class="nomal_font2">운동게시판</a>
				</div>
				<div class="col-1">
					<a
						href="${pageContext.request.contextPath}/toFoodBoard.foodbo?currentPage=1"
						class="nomal_font2">식단게시판</a>
				</div>
				<!-- 로그인 된 상태라면 로그아웃 띄우고 아니면 로그인 버튼 띄우기-->
				<c:choose>
					<c:when test="${!empty loginSession}">
						<div class="col-1">
							<a href="${pageContext.request.contextPath}/logoutProc.mem"
								class="nomal_font2">로그아웃</a>
						</div>
					</c:when>
					<c:otherwise>
						<div class="col-1">
							<a href="${pageContext.request.contextPath}/toLogin.mem"
								class="nomal_font2">로그인</a>
						</div>
					</c:otherwise>
				</c:choose>
				<div class="col-1">
					<a href="${pageContext.request.contextPath}/toSignup.mem"
						class="nomal_font2">회원가입</a>
				</div>
				<c:if test="${!empty loginSession}">
					<div class="col-1">
						<a
							href="${pageContext.request.contextPath}/toMyPage.mem?currentPage=1"
							class="nomal_font2">마이페이지</a>
					</div>
				</c:if>
			</div>
		</div>
	</div>



	<!-- 상단 메뉴바 배경지 -->
	<div class="container-fluid ">
		<div class="row">
			<div class="com">
				<img src="../images/sub_navi.png" class="d-block w-100" alt="...">
			</div>
		</div>
	</div>


	<!-- 메인 COPY -->
	<div class="container">
		<div class="row ">
			<div class="col-5 "></div>
			<div class="col center_img">
				<p class="img_center">
					<img src="../images/train_logo.png">
				</p>
			</div>
			<div class="col-5"></div>
		</div>
	</div>




	<!-- 상단 COPY -->
	<div class="container ">
		<div class="row">
			<div class="col">
				<h1 class="display-4 main_copy text_gradation">마이페이지</h1>
				<h5 class="img_center">내 정보를 수정하고 싶다면 수정 버튼을 눌러주세요.</h5>
			</div>
		</div>
	</div>

	<div class="gab"></div>











	<!-- 내정보 수정 -->

	<div class="container w-50">

		<c:if test="${dto.getMember_category() eq 'business'}">
			<form id="modifyForm"
				action="${pageContext.request.contextPath}/businessModifyInfoProc.mem"
				method="get">
				<div class="row p-2">
					<div class="col-12 ">
						<label for="pw" class="form-label">이름(실명)</label>
					</div>
					<div class="col-6 mb-2 sm-1">
						<input type="text" class="form-control" id="name" name="name"
							value="${dto.getName()}" readonly>
					</div>
				</div>
				<div class="row p-2">
					<div class="col-12">
						<label for="id" class="form-label">아이디</label>
					</div>
					<div class="col-6 mb-2 sm-1">
						<input type="text" class="form-control" id="id" name="id"
							value="${dto.getId()}" readonly>
					</div>
				</div>

				<div class="row p-2">
					<div class="col-12">
						<label for="email" class="form-label">이메일</label>
					</div>
					<div class="col-6 mb-2 sm-1">
						<input type="text" class="form-control" id="email" name="email"
							value="${dto.getEmail()}" readonly>
					</div>
				</div>

				<div class="row p-2">
					<div class="col-12">
						<label for="nickname" class="form-label">닉네임</label>
					</div>
					<div class="col-6 mb-2 sm-1x">
						<input type="text" class="form-control" id="nickname"
							name="nickname" value="${dto.getNickname()}" readonly readonly>
					</div>
				</div>

				<div class="row p-2">
					<div class="col-12">
						<label for="phone" class="form-label">휴대폰 번호</label>
					</div>
					<div class="col-xs-6 col-sm-3">
						<select class="form-select" id="phone1" disabled>
							<option value="010" selected>010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="017">017</option>
							<option value="018">018</option>
							<option value="019">019</option>
						</select>
					</div>
					<div class="col-xs-6 col-sm-3">
						<input type="text" class="form-control" id="phone2" name="phone2"
							readonly>
					</div>
					<div class="col-xs-6 col-sm-3">
						<input type="text" class="form-control" id="phone3" name="phone3"
							readonly>
					</div>
					<div class="col d-none">
						<input type="text" class="form-control" id="phone" name="phone">
					</div>
				</div>

				<div class="row p-2">
					<div class="col-12">
						<label for="businessNo" class="form-label">사업자등록번호</label>
					</div>
					<div class="col-6 mb-2 sm-1x">
						<input type="text" class="form-control" id="business_no"
							name="business_no" value="${dto.getBusiness_no()}" readonly>
					</div>
				</div>


				<div class="row p-2">
					<div class="col-12">
						<label for="businessFile" class="form-label">사업자등록증 파일</label>
					</div>
					<div class="col-6 mb-2 sm-1x businessImg">
						<img class="../imagesize"
							src="${pageContext.request.contextPath}/${filedto.getFileAddr()}/${filedto.getSystem_name()}">
					</div>
				</div>


				<div class="row p-2">
					<label for="addr" class="form-label">운동 센터 주소</label>
					<div class="col-6 mb-2 sm-1">

						<input type="text" class="form-control" id="postCode"
							name="postCode" placeholder="우편번호" value="${dto.getPostcode()}"
							readonly>
					</div>
					<div class="col-6 mb-2 sm-1">
						<button type="button" class="btn btn-warning" id="btnPostCode">우편번호
							찾기</button>
					</div>
				</div>

				<div class="row p-2">
					<div class="col-6 mb-2 sm-1">
						<input type="text" class="form-control" id="roadAddr"
							name="roadAddr" placeholder="도로명주소" value="${dto.getRoadAddr()}"
							readonly>
					</div>
				</div>

				<div class="row p-2">
					<div class="col-6 mb-2 sm-1">
						<input type="text" class="form-control" id="extraAddr"
							name="extraAddr" placeholder="읍/면/동"
							value="${dto.getExtraAddr()}" readonly>
					</div>
					<div class="col-6 mb-2 sm-1">
						<input type="text" class="form-control" id="detailAddr"
							name="detailAddr" placeholder="상세주소"
							value="${dto.getDetailAddr()}" readonly>
					</div>
				</div>

				<div class="row justify-content-center cls-before">
					<div class="col-4 d-flex justify-content-end">
						<p>
							<button type="button" class="btn btn-secondary" id="btnHome">홈으로</button>
						</p>
					</div>
					<div class="col-4 d-flex justify-content-start">
						<p>
							<button type="button" class="btn btn-danger" id="btnModify">수정</button>
						</p>
					</div>

				</div>
				<div class="row justify-content-center cls-before">
					<div class="col-12 d-flex justify-content-end">
						<p>
							<button type="button" class="btn btn-danger btnWithdraw"
								id="btnWithdraw" name="btnWithdraw">탈퇴하기</button>
						</p>
					</div>
				</div>
				<div class="row justify-content-center cls-after">
					<div class="col-4 d-flex justify-content-end">
						<p>
							<button type="button" class="btn btn-secondary" id="btnCancel">취소</button>
						</p>
					</div>
					<div class="col-4 d-flex justify-content-start">
						<p>
							<button type="button" class="btn btn-danger" id="btnComplete">완료</button>
						</p>
					</div>
				</div>

				<div class="gab"></div>
				<div class="gab"></div>

				<div class="row">
					<div class="col">
						<h1 class="display-4 main_copy text_gradation">센터 등록하기</h1>
						<h5 class="img_center">내 센터를 등록하고 싶으시다면 등록버튼을 눌러주세요.</h5>
					</div>
				</div>






				<div class="row">
					<div class="col-3"></div>
					<div class="col-3">
						<p class="text_center">
							<button type="button" class="btn btn-secondary"
								id="btnCenterSignup">센터 등록</button>
						</p>


					</div>
					<div class="col-3">
						<p class="text_center">
							<button type="button" class="btn btn-warning" id="btnCenterPage">센터
								페이지</button>
						</p>
					</div>
					<div class="col-3"></div>
				</div>
			</form>
		</c:if>
	</div>

	<!--내정보 수정 끝 -->




	<div class="gab"></div>
	<div class="gab"></div>
	<div class="gab"></div>


	<!-- 내가쓴 글 보이기-->

	<fieldset class="fieldset">
		<legend>
			<h2 class="display-4 main_copy text_gradation">내가 쓴 게시글</h2>
		</legend>
		<div class="container">
			<br>
			<c:forEach var="dto" items="${list}">
				<div class="row ">
					<div class="col-2"></div>
					<div class="col-6 title text_list">
						${dto.getBoard_category()}
						<c:choose>
							<c:when test="${dto.getBoard_category() eq '고민'}">
								<a
									href="${pageContext.request.contextPath}/toWorryDetailView.worrybo?currentPage=1&board_seq=${dto.getBoard_seq()}">${dto.getBoard_title()}</a>
							</c:when>

							<c:when test="${dto.getBoard_category() eq '자유'}">
								<a
									href="${pageContext.request.contextPath}/toDetailView.freebo?currentPage=1&board_seq=${dto.getBoard_seq()}">${dto.getBoard_title()}</a>
							</c:when>

							<c:when test="${dto.getBoard_category() eq '운동'}">
								<a
									href="${pageContext.request.contextPath}/toExerciseDetailView.exercisebo?currentPage=1&board_seq=${dto.getBoard_seq()}">${dto.getBoard_title()}</a>
							</c:when>

							<c:when test="${dto.getBoard_category() eq '식단'}">
								<a
									href="${pageContext.request.contextPath}/toFoodDetailView.foodbo?currentPage=1&board_seq=${dto.getBoard_seq()}">${dto.getBoard_title()}</a>
							</c:when>

							<c:otherwise>
								<a href="#">${dto.getBoard_title()}</a>
							</c:otherwise>
						</c:choose>

					</div>
					<div class="col-2 written_date text_list">${dto.getWritten_date()}</div>
					<div class="col-2"></div>
				</div>
			</c:forEach>

			<div class="row">
				<nav class="col" aria-label="Page navigation example">
					<ul class="pagination justify-content-center">
						<c:if test="${naviMap.get('needPrev') eq true}">
							<li class="page-item"><a class="page-link"
								href="${pageContext.request.contextPath}/toMyPage.mem?currentPage=${naviMap.get('startNavi')-1}">Previous</a></li>
						</c:if>
						<c:forEach var="i" begin="${naviMap.get('startNavi')}"
							end="${naviMap.get('endNavi')}">
							<li class="page-item"><a class="page-link"
								href="${pageContext.request.contextPath}/toMyPage.mem?currentPage=${i}">${i}</a></li>
						</c:forEach>
						<c:if test="${naviMap.get('needNext') eq true}">
							<li class="page-item"><a class="page-link"
								href="${pageContext.request.contextPath}/toMyPage.mem?currentPage=${naviMap.get('endNavi')+1}">Next</a></li>
						</c:if>
					</ul>
				</nav>
			</div>
		</div>
	</fieldset>

	<!-- 내가 쓴글 보기 끝-->


	<div class="gab"></div>
	<div class="gab"></div>



	<!-- 하단 센터등록 구분 문구 COPY -->
	<div class="gab"></div>
	<div class="container-fluid bag_ivory"></div>



	<div class="gab"></div>




	<!--푸터-->
	<footer>
		<div class="container">
			<div class="row ">
				<div class="col nomal_font footer_margin"></div>
			</div>
			<div class="row">
				<div class="col-2 footer_logo">
					<p class="imgaling">
						<img src="../images/train_logo.png">
					</p>

				</div>
				<div class="col-10 nomal_font">
					(주)휘핑 | 사업자등록번호 : 736-81-01238 | 팀장 : 이동엽 | 개인정보관리자 : 김덕규 김희태 심혜인
					조현재 <br> 주소 : 서울시 송파구 마천로 30, 상가에이동 127, 128호(방이동) | 대표번호 :
					02-3472-4177 | Fax : 02-585-3083 <br> Copyright @ 2021 (주)휘핑
				</div>
			</div>
		</div>

	</footer>
	<script>
	  	//센터등록페이지
		document.getElementById("btnCenterSignup").onclick = function() {
			location.href = "${pageContext.request.contextPath}/toCenterSignup.cen?business_no=${dto.getBusiness_no()}";
		}
		//센터페이지
		document.getElementById("btnCenterPage").onclick = function() {
			location.href = "${pageContext.request.contextPath}/toCenterPage.cen?business_no=${dto.getBusiness_no()}";
		}
		// 비밀번호 입력시 readonly 제거 함수
		function modifyView(){
			$("#email").removeAttr("readonly"); //속성제거
			$("#phone1").removeAttr("disabled"); //속성제거
			$("#phone2").removeAttr("readonly"); //속성제거
			$("#phone3").removeAttr("readonly"); //속성제거
			$("#postCode").removeAttr("readonly"); //속성제거
			$("#roadAddr").removeAttr("readonly"); //속성제거
			$("#extraAddr").removeAttr("readonly"); //속성제거
			$("#detailAddr").removeAttr("readonly"); //속성제거
			$(".cls-after").css("display","flex"); //css변경
			$(".cls-before").css("display","none"); //css변경
		}
		
		//수정 버튼 클릭 시 
		document.getElementById("btnModify").onclick = function(){
			let url = "/pwCheckPopup.mem"; 
	    	let name = "비밀번호 확인";
	    	let option = "width=500, height=200, top=300, left=650";
	    	window.open(url, name, option);
		}  
	
		//완료 버튼 클릭 시
		document.getElementById("btnComplete").onclick = function(){
          let nickname = document.getElementById("nickname");
          let email = document.getElementById("email");
          let phone = document.getElementById("phone");
          let phone1 = document.getElementById("phone1");
          let phone2 = document.getElementById("phone2");
          let phone3 = document.getElementById("phone3");
          let postCode = document.getElementById("postCode");
          let roadAddr = document.getElementById("roadAddr");
          let extraAddr = document.getElementById("extraAddr");
          let detailAddr = document.getElementById("detailAddr");
          
          // 닉네임 정규식 
          let regexNickname = /[ㄱ-힣a-zA-Z0-9]{2,16}/;
          let regexPhone = /[0-9]{11}/;
          
          phone.value = phone1.value + phone2.value + phone3.value;
          
          if(!regexNickname.test(nickname.value) || nickname.value == ""){
             alert("닉네임을 올바르게 입력하세요.");
             return;
          }else if(!regexPhone.test(phone.value) || phone2.value == "" || phone3.value == ""){
             alert("핸드폰 번호를 올바르게 입력하세요.");
             return;
          }else if(postCode.value == "" || roadAddr == ""){
             alert("운동주소를 올바르게 입력하세요.");
             return;
          }
          
          //변경사항없을때 띄울 팝업 작성필요...접근방법 = 서버에있는값과 입력값이 동일한지 확인
          
          alert("정보수정 완료!")
          document.getElementById("modifyForm").submit();
       }
		// 취소 버튼 클릭시
    	document.getElementById("btnCancel").onclick = function(){
    		location.href = "${pageContext.request.contextPath}/toMyPage.mem?currentPage=1";
    	}
		
		// 탈퇴 버튼 클릭 시
		
		document.getElementById("btnWithdraw").onclick = function(){
			
			 let result = confirm('정말 탈퇴하시겠습니까?');
		     	if(result){
		     		location.href = "${pageContext.request.contextPath}/logoutProc.mem";
		     	}else{
		     		location.href = "${pageContext.request.contextPath}/toMyPage.mem?currentPage=1";
		     	}	
    	}
       // 홈으로 버튼 클릭 시
       document.getElementById("btnHome").onclick = function(){
          location.href = "${pageContext.request.contextPath}/home";
       }

      // phone 
      let oriPhone = "${dto.getPhone()}";
      document.getElementById("phone1").value = oriPhone.substring(0,3);
      document.getElementById("phone2").value = oriPhone.substring(3,7);
      document.getElementById("phone3").value = oriPhone.substring(7);   

      //주소(카카오api)
       let btnPostCode = document.getElementById("btnPostCode");
       btnPostCode.addEventListener("click", openPostSearch);
       function openPostSearch() {
           new daum.Postcode({
               oncomplete: function(data) {
                   let roadAddr = ''; // 도로명 주소 변수
                   var extraAddr = ''; // 참고항목 변수

                   roadAddr = data.roadAddress;

                   if(data.userSelectedType === 'R'){
                       if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                           extraAddr += data.bname;
                       }
                       if(data.buildingName !== '' && data.apartment === 'Y'){
                           extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                       }
                       if(extraAddr !== ''){
                           extraAddr = ' (' + extraAddr + ')';
                       }
                       document.getElementById("extraAddr").value = extraAddr;
                   } else {
                       document.getElementById("extraAddr").value = '';
                   }
                   // 우편번호와 주소 정보를 해당 필드에 넣는다.
                   document.getElementById('postCode').value = data.zonecode;
                   document.getElementById("roadAddr").value = roadAddr;
                   // 커서를 상세주소 필드로 이동한다.
                   document.getElementById("detailAddr").focus();
               }
           }).open({
               popupTitle: "우편 번호 검색",
               popupKey: "popup1",
           });
       }
    </script>
</body>
</html>