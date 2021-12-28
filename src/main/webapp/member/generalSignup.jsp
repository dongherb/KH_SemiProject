<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일반 회원 :: 회원가입</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
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

.layout {
	witdh: 500px;
}

.titleContent {
	margin-top: 30px;
	margin-left: 15px;
	margin-bottom: -10px;
}

.idNotice {
	font-size: 12px;
}

.content {
	color: balck;
}

.btnBundle {
	margin-top: 40px;
}

footer {
	background-color: lightgray;
	height: 180px;
	margin-top: 150px;
}

.footer_margin {
	margin-top: 50px;
	margin-bottom: 5px;
}

.footer_logo img {
	width: 100%;
}
</style>
<body>
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
		<div class="row align-items-center justify-content-center">
			<div class="col-2"></div>
			<div class="col py-5 titleContent">
				<h3>일반회원가입</h3>
				<p class="md-4">회원가입을 위해 회원정보를 입력해주세요.</p>
			</div>
		</div>
		<form id="generalSignupForm" name="generalSignupForm"
			action="${pageContext.request.contextPath}/generalSignupProc.mem"
			method="post">
			<div class="row p-2">
				<div class="col-2"></div>
				<div class="col-1 content">이름(실명)</div>
				<div class="col-4 mb-2 sm-1">
					<input type="text" class="form-control" id="name" name="name"
						placeholder="이름(실명)">
				</div>
			</div>

			<div class="row p-2">
				<div class="col-2"></div>
				<div class="col-1 content">아이디</div>
				<div class="col-4 mb-2 sm-1">
					<input type="text" class="form-control" id="id" name="id"
						placeholder="아이디" readonly>
					<div class="idNotice">※아이디는 반드시 영문자로 시작하며 6자리 이상만 등록가능합니다.</div>
				</div>
				<div class="col-2 mb-2 sm-1">
					<button type="button" id="btnCheckId" class="btn btn-warning w-100">아이디
						확인</button>
				</div>
			</div>

			<div class="row p-2">
				<div class="col align-items-center rsInput" id="rsId">
					<div id="showIdCheck"></div>
				</div>
			</div>
			<div class="row p-2">
				<div class="col-2"></div>
				<div class="col-1 content">비밀번호</div>
				<div class="col-4 mb-2 sm-1">
					<input type="password" class="form-control" id="pw" name="password">
					<div class="idNotice">※비밀번호는 6자리~20자리 이하만 사용가능합니다</div>
				</div>
			</div>

			<div class="row p-2">
				<div class="col-2"></div>
				<div class="col-1 content">비밀번호 확인</div>
				<div class="col-4 mb-2 sm-1">
					<input type="password" class="form-control" id="pwCheck">
				</div>
			</div>
			<div class="row p-2">
				<div class="col-3"></div>
				<div class="col-4 mb-2">
					<div id="showPwCheck"></div>
				</div>
			</div>

			<div class="row p-2">
				<div class="col-2"></div>
				<div class="col-1 content">이메일</div>
				<div class="col-4 mb-2 sm-1">
					<input type="text" class="form-control" id="email" name="email">
				</div>
			</div>

			<div class="row p-2">
				<div class="col-2"></div>
				<div class="col-1 content">닉네임</div>
				<div class="col-4 mb-2 sm-1x">
					<input type="text" class="form-control" id="nickname"name="nickname">
					<div class="idNotice">※닉네임은 2자리~16자리 이하만 사용가능합니다.</div>
				</div>
			</div>

			<div class="row p-2">
				<div class="col-2"></div>
				<div class="col-1 content">핸드폰번호</div>
				<div class="col-1 sm-3">
					<select class="form-select" id="phone1">
						<option value="010" selected>010</option>
						<option value="011">011</option>
						<option value="016">016</option>
						<option value="017">017</option>
						<option value="018">018</option>
						<option value="019">019</option>
					</select>
				</div>
				<div class="col-1 sm-3">
					<input type="text" class="form-control" id="phone2" name="phone2">
				</div>
				<div class="col-1 sm-3">
					<input type="text" class="form-control" id="phone3" name="phone3">
				</div>
				<div class="col d-none">
					<input type="text" class="form-control" id="phone" name="phone">
				</div>
			</div>
			<div class="row p-2">
				<div class="col-2"></div>
				<div class="col-1 content">우편번호</div>
				<div class="col-4 mb-2 sm-1">
					<input type="text" class="form-control" id="postCode"
						name="postCode" placeholder="우편번호" readonly>
				</div>
				<div class="col-2 mb-2 sm-1">
					<button type="button" class="btn btn-primary w-100"
						id="btnPostCode">우편번호 찾기</button>
				</div>
			</div>
			<div class="row p-2">
				<div class="col-2"></div>
				<div class="col-1 content">도로명주소</div>
				<div class="col-4 mb-2 sm-1">
					<input type="text" class="form-control" id="roadAddr"
						name="roadAddr">
				</div>
			</div>

			<div class="row p-2">
				<div class="col-2"></div>
				<div class="col-1 content">읍/면/동</div>
				<div class="col-4 mb-2 sm-1">
					<input type="text" class="form-control" id="extraAddr"
						name="extraAddr">
				</div>
			</div>

			<div class="row p-2">
				<div class="col-2"></div>
				<div class="col-1 content">상세주소</div>
				<div class="col-4 mb-2 sm-1">
					<input type="text" class="form-control" id="detailAddr"
						name="detailAddr">
				</div>

			</div>

			<div class="row justify-content-center btnBundle">
				<div class="col-2 d-flex justify-content-end">
					<button type="button" class="btn btn-secondary" id="btnHome">홈화면</button>
				</div>
				<div class="col-4 d-flex justify-content-start">
					<button type="button" class="btn btn-success" id="btnSubmit">가입</button>
				</div>
			</div>
		</form>
	</div>

	<script>
			//기본 요소
			let btnCheckId = document.getElementById("btnCheckId");
			
			//홈화면 버튼
			document.getElementById("btnHome").addEventListener("click", function(){ 
				location.href = "${pageContext.request.contextPath}/home";
			});
			
			//가입 버튼 클릭 시
			document.getElementById("btnSubmit").addEventListener("click",function(){
				
			//기본 요소
			let id = document.getElementById("id");
			let pw = document.getElementById("pw");
			let nickname = document.getElementById("nickname");
			let email = document.getElementById("email");	
			
			//핸드폰 요소
			let phone = document.getElementById("phone");
	    	let phone1 = document.getElementById("phone1");
	    	let phone2 = document.getElementById("phone2");
	    	let phone3 = document.getElementById("phone3");
	    	
	    	//주소 요소
	    	let postCode = document.getElementById("postCode");
	    	let roadAddr = document.getElementById("roadAddr");
	    	let detailAddr = document.getElementById("detailAddr");
	    	let extraAddr = document.getElementById("extraAddr");
			
			//정규식
			let regexPw = /[a-zA-Z0-9~!@#$%^&*()_+.]{6,20}/;
			let regexNickname = /[ㄱ-힣a-zA-Z0-9]{2,16}/;
			
			
			if(name.value == ""){
	    		alert("이름을 입력하세요.");
	    		return;
			}else if(!regexPw.test(pw.value) || pw.value == ""){
	    		alert("비밀번호를 올바르게 입력하세요.");
	    		return;
			}else if(pw.value !== document.getElementById("pwCheck").value){
		    	alert("비밀번호 확인을 올바르게 입력하세요.");
		    	return;
			}else if(email.value ==""){
				alert("이메일을 올바르게 입력하세요.");
		    	return;
			}else if(phone2.value == "" || phone3.value == ""){ 
	    		alert("휴대폰 번호를 올바르게 입력하세요.");
	    		return;
	    	}else if(postCode.value =="" || roadAddr.value ==""){
	    		alert("주소를 올바르게 입력하세요.");
	    		return;
	    	}
		
	    	phone.value = phone1.value + phone2.value + phone3.value;
	    	document.getElementById("generalSignupForm").submit();
			});

			//아이디 확인버튼
		    btnCheckId.addEventListener("click", function(){
		    	let url = "/idCheckPopup.mem"; 
		    	let name = "아이디 중복검사";
		    	let option = "width=600, height=600, top=300, left=650";
		    	window.open(url, name, option);
			});
		    
			//비밀번호 실시간 체크
			pwCheck.onchange = function () {
        		if (pw.value !== "" && pwCheck.value !== "") {
            		if (pw.value == pwCheck.value) {
            			showPwCheck.innerHTML = "비밀번호 일치!"
            			showPwCheck.style.color = "green";
            			}else{
            			showPwCheck.innerHTML = "비밀번호 불일치!"
            			showPwCheck.style.color = "red";
            		}
        		}else{
        			showPwCheck.innerHTML = "";
        		}
    		}
			
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