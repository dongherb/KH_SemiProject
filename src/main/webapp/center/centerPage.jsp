<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- jstl 태그-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 부트스트랩 태그 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<!-- jquery 태그 -->
<script
  src="https://code.jquery.com/jquery-3.6.0.js"
  integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
  crossorigin="anonymous"></script>
	
<title>Insert title here</title>
<style>
	  .cls-after {
                    display: none;
                }

                .img3 {
                    width: 100px;
                    height: 100px;
                }


                #btnOpenPostCode {
                    width: 100%;
                }

                .img2 {
                    width: 100px;
                    height: 100px;
                }



                * {
                    box-sizing: border-box;
                    margin: 0;
                    padding: 0;
                    text-decoration: none;
                    color: rgb(109, 109, 109);
                }

                @import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&display=swap');

                .center {
                    text-align: center;
                }

                .font_nanum {
                    font-family: 'Nanum Gothic', sans-serif, ;
                }

                .nomal_font {
                    font-family: 'Nanum Gothic', sans-serif, ;
                    text-decoration: none;
                    color: rgb(109, 109, 109);
                    font-size: 13px;
                }

                .nomal_font2 {
                    font-family: 'Nanum Gothic', sans-serif, ;
                    text-decoration: none;
                    color: rgb(109, 109, 109);
                    font-size: 15px;
                    font-weight: 600;
                    line-height: 3.3;
                }

                .nomal_font3 {
                    font-family: 'Nanum Gothic', sans-serif, ;
                    text-decoration: none;
                    color: rgb(109, 109, 109);
                    font-size: 19px;
                    font-weight: 500;

                }

                label {
                    font-family: 'Nanum Gothic', sans-serif, ;
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

                .point {}

                .main_copy {


                    text-align: center;
                    font-family: 'Nanum Gothic', sans-serif, ;
                    font-weight: bold;

                    color: white
                }

                .main_copy2 {

                    font-family: 'Nanum Gothic', sans-serif, ;
                    font-weight: bold;
                    color: white;

                    text-align: center;

                }

                .main_copy3 {
                    text-align: center;
                    font-family: 'Nanum Gothic', sans-serif, ;
                    font-weight: bold;
                    color: white;
                }

                .main_gray {

                    font-family: 'Nanum Gothic', sans-serif, ;
                    font-weight: bold;
                    color: gray;
                }

                .text_gradation {
                    font-family: 'Nanum Gothic', sans-serif, ;
                    font-weight: bold;
                    outline: 3px white;
                    background: linear-gradient(to right, rgb(234, 7, 140), rgb(141, 33, 190));
                    color: transparent;
                    -webkit-background-clip: text;

                }

                .text_gradation3 {
                    text-align: center;
                    font-family: 'Nanum Gothic', sans-serif, ;
                    font-weight: bold;
                    font-size: 25px;
                    background: linear-gradient(to right, rgb(234, 7, 140), rgb(141, 33, 190));
                    color: transparent;
                    -webkit-background-clip: text;

                }

                .text_gradation_outline {
                    font-family: 'Nanum Gothic', sans-serif, ;
                    font-weight: bold;
                    outline: 3px white;
                    background: linear-gradient(to right, rgb(234, 7, 140), rgb(141, 33, 190));
                    color: transparent;
                    -webkit-background-clip: text;
                    -webkit-text-stroke-width: 0.5px;
                    -webkit-text-stroke-color: white;
                }

                .text_gradation_blue {
                    font-family: 'Nanum Gothic', sans-serif, ;
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
                    font-family: 'Nanum Gothic', sans-serif, ;
                    font-weight: bold;
                    color: gray;
                    font-size: 25px;
                }

                .gab {
                    margin-top: 50px;
                    margin-bottom: 30px;
                }


                .wide-700 {
                    width: 300px;
                }

                .text_center {
                    text-align: center;
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
                .centerImg > img {
                	width : 300px;
                	height : 300px;
                }
</style>
</head>
<script>
	//운동종류 체크박스 받기
	$(document).ready(function(){
		var splitCode = $("#splitCode").val().split(",");
	    for (var idx in splitCode) {
	    	$('input:checkbox[name=SEQ_CHK][value='+splitCode[idx]+']').prop("checked", true);
	    }
	});
</script>
<body>
	
	 <div class="naviBox">
        <div class="container">
            <div class="row shadow round navi_size navi_back">
                <div class="col-3 navi_logo">
                    <a href="${pageContext.request.contextPath}/home"> <img src="images/train_logo_typo.png"></a>   
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



            <!-- 상단 메뉴바 배경지 -->
            <div class="container-fluid ">
                <div class="row">
                    <div class="com">
                        <img src="images/sub_navi.png" class="d-block w-100" alt="...">
                    </div>
                </div>
            </div>



            <!-- 메인 COPY -->
            <div class="container">
                <div class="row ">
                    <div class="col-5 "></div>
                    <div class="col center_img">
                        <p class="img_center">
                            <img src="images/train_logo.png">
                        </p>
                    </div>
                    <div class="col-5"></div>
                </div>
            </div>




            <!-- 상단 COPY -->
            <div class="container ">
                <div class="row">
                    <div class="col">
                        <h1 class="display-4 main_copy text_gradation">센터 정보 </h1>
                        <h5 class="img_center">내 센터의 정보 입니다. </h5>
                    </div>
                </div>
            </div>

            <div class="gab"></div>
           
	<form action="${pageContext.request.contextPath}/centerModifyProc.cen" method="post" id="centerModifyForm" name="centerModifyForm">
	<!-- 등록한 센터가 존재하는지 확인 -->
	<c:if test = "${rs eq 'false'}">
		<input type=hidden id="rs" value="false">
	</c:if> 
		<div class="container">
			<div class="row">
				<div class="col">
					<h1>LOGO</h1>
				</div>
			</div>
			<div class="row">
				<div class="col">
					<h3>센터정보</h3>
					<input type="hidden" name="center_seq" id="center_seq" value="${dto.getCenter_seq()}">
				</div>
			</div>
			<div class="row p-2">
				<div class="col-12">
					<p>사업자등록번호</p>
				</div>
				<div class="col-12">
					<input type="text" class="form-control" name="business_no" id="business_no" 
						value="${dto.getBusiness_no()}" readonly>
				</div>		
			</div>
			<div class="row p-2">
				<div class="col-12 centerImg">
					<img class="detailImg" alt="안나오는 이미지입니다." src="${pageContext.request.contextPath}/${CPdto.getPicAddr()}/${CPdto.getSystem_name()}">
				</div>
			</div>
			<div class="row p-2">
				<div class="col-12">
					<p>센터이름</p>
				</div>
				<div class="col-12">
					<input type="text" class="form-control" name="center_name"
						id="center_name" value="${dto.getCenter_name()}" readonly>
				</div>
			</div>
			<div class="row p-2">
				<div class="col-12">
					<p>월 이용료</p>
				</div>
				<div class="col-12">
					<input type="text" class="form-control" name="center_price"
						id="center_price" value="${dto.getCenter_price()}" readonly>
				</div>
			</div>
			<div class="row p-2">
				<div class="col-12">
					<p>운동 분류</p>
				</div>
				<div class="col-12">
					<tr>
				        <td>         
							<span>
								<label for="check1">헬스</label>
								<input type="checkbox" name="SEQ_CHK" id="check1" value="헬스" disabled>
							</span>
							<span>
								<label for="check2">요가</label>
								<input type="checkbox" name="SEQ_CHK" id="check2" value="요가" disabled>
							</span>
							<span>
								<label for="check3">필라테스</label>
								<input type="checkbox" name="SEQ_CHK" id="check3" value="필라테스" disabled>
							</span>
							<span>
								<label for="check4">복싱</label>
								<input type="checkbox" name="SEQ_CHK" id="check4" value="복싱" disabled>
							</span>
							<span>
								<label for="check5">PT</label>
								<input type="checkbox" name="SEQ_CHK" id="check5" value="PT" disabled>
							</span>				       
							
				            <input type="hidden" name="exercise" id="exercise" value="">
				            <input type="hidden" name="splitCode" id="splitCode" value="${dto.getExercise()}">
				        </td>	  
				    </tr>
				</div>
			</div>
			<div class="row p-2">
				<div class="col-12">
					<p>센터 번호</p>
				</div>
				<div class="col-4">
					<select class="form-select" id="center_tel1" disabled> 
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="016">016</option>
						<option value="017">017</option>
						<option value="018">018</option>
						<option value="019">019</option>
					</select>
				</div>
				<div class="col-4">
					<input type="text" class="form-control" id="center_tel2" readonly>
				</div>
				<div class="col-4">
					<input type="text" class="form-control" id="center_tel3" readonly>
				</div>
				<div class="col-4 d-none"> <!-- phone 1+2+3 을 합치기위한 공간, d-none으로 숨겨놓음 -->
					<input type="text" class="form-control" id="center_tel" name="center_tel">
				</div>
			</div>
			<div class="row p-2"> <!-- 주소 보여주기 창 -->
				<div class="col-12"><label for="center_address" class="form-lable">주소</label></div>
				<div class="col">
					<input type="text" class="form-control" id="center_address" name="center_address" value="${dto.getPostcode()} ${dto.getRoadAddr()} ${dto.getExtraAddr()} ${dto.getDetailAddr()}" readonly>
				</div>
			</div>
			<div class="row p-2 cls-after">
				<div class="col-6">
					<input type="text" class="form-control" id="postCode" name="postCode" value="${dto.getPostcode()}"
						placeholder="우편번호">
				</div>
				<div class="col-6">
					<button type="button" id="btnOpenPostCode" class="btn btn-dark w-100">우편번호 찾기</button>
				</div>
			</div>
			<div class="row p-2 cls-after">
				<div class="col">
					<input type="text" class="form-control" id="roadAddr" name="roadAddr" value="${dto.getRoadAddr()}"
						placeholder="도로명주소">
				</div>

			</div>
			<div class="row p-2 cls-after">
				
				<div class="col">
					<input type="text" class="form-control" id="extraAddr" name="extraAddr" value="${dto.getExtraAddr()}"
						placeholder="읍/면/동" >
				</div>
				<div class="col">
					<input type="text" class="form-control" id="detailAddr" name="detailAddr" value="${dto.getDetailAddr()}"
						placeholder="상세주소" >
				</div>
				<div class="col d-none">
					<input type="text" class="form-control" id="centerAddr" name="centerAddr">
				</div>
			</div>
			<div class="row p-2 justify-content-center cls-before">
				<div class="col-4 d-flex justify-content-end">
					<button type="button" class="btn btn-secondary" id="btnCancel1">취소</button>
				</div>
				<div class="col-4 d-flex justify-content-start">
					<button type="button" class="btn btn-danger" id="btnModify">수정</button>
				</div>	
			</div>
			<div class="row p-2 justify-content-center cls-after">
				<div class="col-4 d-flex justify-content-end">
					<button type="button" class="btn btn-secondary" id="btnCancel2">취소</button>
				</div>
				<div class="col-4 d-flex justify-content-center">
					<button type="button" class="btn btn-secondary" id="btnHome">홈으로</button>
				</div>
				<div class="col-4 d-flex justify-content-start">
					<button type="button" class="btn btn-danger" id="btnComplete">완료</button>
				</div>	
			</div>
		</div>
	</form>
	
	<div class="gab"></div>
            <div class="gab"></div>
            <!--푸터-->
<footer>
    <div class="container">
        <div class="row ">
          <div class="col nomal_font footer_margin">
           
          </div>
        </div>
        <div class="row">
          <div class="col-2 footer_logo">
              <p class="imgaling">
                 <img src="images/train_logo.png"> 
              </p>
            
          </div>
          <div class="col-10 nomal_font">
            (주)휘핑 | 사업자등록번호 : 736-81-01238 | 팀장 : 이동엽 | 개인정보관리자 : 김덕규  김희태 심혜인 조현재 
            <br>
            주소 : 서울시 송파구 마천로 30, 상가에이동 127, 128호(방이동) | 대표번호 : 02-3472-4177 | Fax : 02-585-3083
            <br>
            Copyright @ 2021 (주)휘핑
          </div>
        </div>
      </div>

</footer>
	
	
	
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"> //우편 api 태그
	</script>
	
	<script>
	
	// 센터등록여부에 대해 결과 리턴
	$(document).ready(function(){ 
		if(document.getElementById("rs").value == "false"){
		alert("등록된 센터가 없습니다. 센터를 등록하세요.")
		location.href = "${pageContext.request.contextPath}/toMyPage.mem?currentPage=1";
		}else{
		alert("센터조회가능합니다.")	
		} 
	});
	
	//프로필썸네일
	function setCenter_profile(event) { 
		let reader = new FileReader();
		reader.onload = function(event) { 
			let img = document.createElement("img"); // img 요소생성
			img.setAttribute("src", event.target.result); //img src속성에 사진추가
			document.querySelector("div#profile_container").appendChild(img); 
		}; 
		reader.readAsDataURL(event.target.files[0]); 
	}
	
	// 운동종류 체크박스 보내기
	function fnGetdata(){ 
	    let obj = $("[name=SEQ_CHK]");
	    let chkArray = []; // 배열 선언
	
	    $('input:checkbox[name=SEQ_CHK]:checked').each(function() { // 체크된 체크박스의 value 값을 가지고 온다.
	        chkArray.push(this.value);
	    });
	    $('#exercise').val(chkArray);
	}
	// 홈으로 버튼 클릭시
	document.getElementById("btnHome").onclick = function(){
		location.href = "${pageContext.request.contextPath}/"
	}
	// 취소2 버튼 클릭시
	document.getElementById("btnCancel2").onclick = function(){
		location.href = "${PageContext.request.contextPath}/toCenterPage.cen?business_no=${dto.getBusiness_no()}"
	}
	
	// 취소1 버튼 클릭시
	document.getElementById("btnCancel1").onclick = function(){
		location.href = "${pageContext.request.contextPath}/toMyPage.mem?currentPage=1"
	}
	//phone 나누기
	let oriPhone = "${dto.getCenter_tel()}"; 
	document.getElementById("center_tel1").value = oriPhone.substring(0,3);
	document.getElementById("center_tel2").value = oriPhone.substring(3,7);
	document.getElementById("center_tel3").value = oriPhone.substring(7,11);
	
	// 비밀번호 입력시 readonly 제거 함수
	function modifyView(){
		$("#center_name").removeAttr("readonly"); //속성제거
		$("#center_price").removeAttr("readonly"); //속성제거
		$("#center_tel1").removeAttr("disabled"); //속성제거
		$("#center_tel2").removeAttr("readonly"); //속성제거
		$("#center_tel3").removeAttr("readonly"); //속성제거
		$("#exercise").removeAttr("disabled"); //속성제거
		$("input:checkbox[name=SEQ_CHK]").removeAttr("disabled");
		$(".cls-after").css("display","flex"); //css변경
		$(".cls-before").css("display","none"); //css변경
	}
	
	//수정 버튼을 눌렀을 때
	$("#btnModify").on("click", function(){
		let url = "/pwCheckPopup.cen"; 
    	let name = "비밀번호 확인";
    	let option = "width=500, height=200, top=300, left=650";
    	window.open(url, name, option);
	})
	
	// 완료 버튼 클릭시
	document.getElementById("btnComplete").onclick = function(){	
		let center_name = document.getElementById("center_name");
		let center_price = document.getElementById("center_price");
		let center_tel1 = document.getElementById("center_tel1");
		let center_tel2 = document.getElementById("center_tel2");
		let center_tel3 = document.getElementById("center_tel3");
		let center_tel = document.getElementById("center_tel");
		let postCode = document.getElementById("postCode");
		let roadAddr = document.getElementById("roadAddr");
		let detailAddr = document.getElementById("detailAddr");
		let extraAddr = document.getElementById("extraAddr");
		let centerAddr = document.getElementById("centerAddr");
		let regexPrice = /[0-9]{5,10}/;
		let regexPw = /[a-zA-Z0-9~!@#$%^&*()_+.]{6,20}/;
        let regexCenter_tel2 = /[0-9]{3,4}/;
        let regexCenter_tel3 = /[0-9]{4}/;
		
		center_tel.value = center_tel1.value + center_tel2.value + center_tel3.value;
		centerAddr.value = postCode.value + " " + roadAddr.value + " " + extraAddr.value + " " + detailAddr.value;   
		
		if(center_name.value == ""){
			alert("센터이름을 올바르게 입력하세요.");
			return;
		}else if(!regexPrice.test(center_price.value)|| center_price.value ==""){
			alert("이용료를 올바르게 입력하세요.");
			return;
		}else if(center_tel2.value == "" || center_tel3.value == "" || !regexCenter_tel2.test(center_tel2.value) || !regexCenter_tel3.test(center_tel3.value)){
			alert("센터 번호를 올바르게 입력하세요.");
			return;
		}else if(postCode.value =="" || roadAddr.value == ""){
			alert("주소를 올바르게 입력하세요");
			return;
		}
		
		//제출
		fnGetdata();
		document.getElementById("centerModifyForm").submit();
	}
	
	
	
	//카카오주소 api
		let btnOpenPostCode = document.getElementById("btnOpenPostCode");
		btnOpenPostCode.addEventListener("click", function() {
			openPostCode();
		})
		//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
		function openPostCode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

							// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var roadAddr = data.roadAddress; // 도로명 주소 변수
							var extraRoadAddr = ''; // 참고 항목 변수

							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraRoadAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraRoadAddr += (extraRoadAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							if (extraRoadAddr !== '') {
								extraRoadAddr = ' (' + extraRoadAddr + ')';
							}

							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							document.getElementById('postCode').value = data.zonecode;
							document.getElementById("roadAddr").value = roadAddr;
							
							// 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
							if (roadAddr !== '') {
								document.getElementById("extraAddr").value = extraRoadAddr;
							} else {
								document.getElementById("extraAddr").value = '';
							}
						}
					}).open();
		}
	</script>
</body>
</html>