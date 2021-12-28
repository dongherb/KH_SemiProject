<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- jstl 태그-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- 부트스트랩 태그 -->

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    




<!-- jquery 태그 -->
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<title>카카오 맵</title>


<style>
    *{
        box-sizing: border-box;
        margin: 0;
        padding: 0;
        text-decoration: none;
        color: rgb(109, 109, 109);
    }
    
        @import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&display=swap');
        .text_right{
        	margin-left: 200px;
        	border-box:1px solid black;
        }
        .center{
            text-align: center;
        }
        .font_nanum{
            font-family: 'Nanum Gothic', sans-serif, ;
        }
        .nomal_font{
            font-family: 'Nanum Gothic', sans-serif, ;
            text-decoration: none;
            color: rgb(109, 109, 109);
            font-size: 13px;
        }
        .nomal_font2{
            font-family: 'Nanum Gothic', sans-serif, ;
            text-decoration: none;
            color: rgb(109, 109, 109);
            font-size: 15px;
            font-weight: 600;
            line-height: 3.3;
        }
        .nomal_font3{
            font-family: 'Nanum Gothic', sans-serif, ;
            text-decoration: none;
            color: rgb(109, 109, 109);
            font-size: 19px;
            font-weight: 500;

        }

        label{
            font-family: 'Nanum Gothic', sans-serif, ;
            text-decoration: none;
            color: rgb(109, 109, 109);
            font-size: 19px;
            font-weight: 500;

        }



        .container{
            margin: auto;
        }
    
        .navi_logo img{
            padding-top: 12px;
            padding-left: 30px;
            width: 40%;
        }
    
        .round {
        border-radius: 30px;
    }
    .navi_size{
        height: 50px;
        margin-top: 20px;
    }
    .naviBox {
        position: fixed;
        top : 10px;
        left : 0;
        right: 0;
        z-index: 1;
    }
    .navi_back{
        background-color: rgb(255, 255, 255, 0.8);
    }
    .gab{
        margin-top: 50px;
        margin-bottom: 50px;
    }

    .gab_small{
        margin-top: 10px;
        margin-bottom: 10px;
    }
    
    .point{
    
    }
    
    .main_copy{
        
       
        text-align: center;
        font-family: 'Nanum Gothic', sans-serif, ;
        font-weight: bold;
       
        color: white
       
    }
    .main_copy2{
        
        font-family: 'Nanum Gothic', sans-serif, ;
        font-weight: bold;
        color: white;
        
        text-align: center;
    
    }
    .main_copy3{
        text-align: center;
        font-family: 'Nanum Gothic', sans-serif, ;
        font-weight: bold;
        color: white;
    }
    
    .main_gray{
    
    font-family: 'Nanum Gothic', sans-serif, ;
    font-weight: bold;
    color: gray;
    }
    
    .text_gradation {
        font-family: 'Nanum Gothic', sans-serif, ;
        font-weight: bold;
        outline: 3px white;
        background : linear-gradient(to right, rgb(234, 7, 140), rgb(141, 33, 190));
        color: transparent;
        -webkit-background-clip: text;

    }

    .text_gradation3 {
        text-align: center;
        font-family: 'Nanum Gothic', sans-serif, ;
        font-weight: bold;
        font-size: 25px;
        background : linear-gradient(to right, rgb(234, 7, 140), rgb(141, 33, 190));
        color: transparent;
        -webkit-background-clip: text;

    }

    .text_gradation_outline {
        font-family: 'Nanum Gothic', sans-serif, ;
        font-weight: bold;
        outline: 3px white;
        background : linear-gradient(to right, rgb(234, 7, 140), rgb(141, 33, 190));
        color: transparent;
        -webkit-background-clip: text;
        -webkit-text-stroke-width: 0.5px;
        -webkit-text-stroke-color: white;
    }

.center_img img{
    margin-top: 50px;
    width: 30%;

}
    .img_center{
        text-align: center;
    }


    .t_center{
        padding-top: 8px;
        line-height: 1;
    }

    .border{
        border: 1px solid black;
    }
    .inner_padding{
        padding-right: 15px;
    }

    .bg_color{
        background-color: burlywood;
    }

    .center_name{
        font-family: 'Nanum Gothic', sans-serif, ;
        font-weight: bold;
        color: gray;
        font-size: 25px;
    }
    
    footer{
    background-color: lightgray;
    height: 250px;
}
.footer_margin{
    margin-top: 50px;
    margin-bottom: 10px;
}
.footer_logo img{
   
    width: 50%;
}
.imgaling{
    text-align: right;
}
.centerBox{
	overflow-y:scroll;
	height:700px;
}
.card-title > p{
	fontsize: 15px;
}
</style>

</head>

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


<div class="container ">
    <div class="row">
        <div class="col">
            <h1 class="display-4 main_copy text_gradation">당신의 가능성을 시작하세요.  </h1>
            <h5 class="img_center">Your possibilities are infinite. Start now.</h5>
        </div>
    </div>
</div>

<div class="gab"></div>



<!-- 검색페이지 시작-->
	<div class="container ct-container">
		<div class="ct-inputBox">
	       	<form name ="searchForm" id="searchForm" method="post">
		            <div class="row searchBox m-1">
                        <div class="col-2"></div>
                        <div class="col-7 hi_small">
                            <div class="input-group hi_small">
                                <span class="input-group-text nomal_font" id="basic-addon1">
                                    <h6 class="t_center">운동센터 검색하기</h6></span>
                                <input type="text" class="form-control nomal_font" id="searchAddr" name="searchAddr" placeholder="검색하실 동 입력" aria-label="Username" aria-describedby="basic-addon1">
                            </div>
                        </div>
                        <div class="col-1 comment-input d-flex align-items-center justify-content-center">
                            <button type="button" id="btnSearchSubmit"class="btn btn-warning">검색</button>
                        </div>
                        
                        <div class="col-2"></div>
                        <div class="col-12 gab_small"></div>
                        <div class="col-2"></div>
	               		<div class="col-1 nomal_font3"></div>
	               		<div class="col-9 d-flex text_right">
							<table class= "table text_right">
								<tbody>
									<tr>
								        <td class="text_right" style="border-bottom: none;">  
											<span>
												<label for="check1">헬스</label>
												<input type="checkbox" name="SEQ_CHK" id="check1" value="헬스">
											</span>
		                                    &nbsp; &nbsp;
											<span>
												<label for="check2">요가</label>
												<input type="checkbox" name="SEQ_CHK" id="check2" value="요가">
											</span>
		                                    &nbsp; &nbsp;
											<span>
												<label for="check3">필라테스</label>
												<input type="checkbox" name="SEQ_CHK" id="check3" value="필라테스">
											</span>
		                                    &nbsp; &nbsp;
											<span>
												<label for="check4">복싱</label>
												<input type="checkbox" name="SEQ_CHK" id="check4" value="복싱">
											</span>
		                                    &nbsp; &nbsp;
											<span>
												<label for="check5">1:1 PT</label>
												<input type="checkbox" name="SEQ_CHK" id="check5" value="1:1 PT">
											</span>	
											 &nbsp; &nbsp; &nbsp; &nbsp;
											<span>
												<input type="radio" name="orderBy" value="asc" checked="checked">낮은가격순
		  										<input type="radio" name="orderBy" value="desc">높은가격순
											</span>					       
								            <input type="hidden" name="exercise" id="exercise" value="">
								        </td>	  
								    </tr>
							    </tbody>
						    </table>
						</div>
	    	       	</div>   
	       	</form>
	     </div>     
	</div>
	<div class="container">
		<div class="row">
			<div class="col-3 border round">
				<div class="container centerBox text_gradation3">운동센터 목록&nbsp; </div>
            </div>
			<div class="col-8">
				<div id="map" style="width:100%;height:700px;"></div>
			</div>
            <div class="col-1"></div>
		</div>
	</div>  



<!--푸터-->
<div class="gab"></div>
<div class="gab"></div>
<footer>
    <div class="container">
        <div class="row ">
          <div class="col nomal_font footer_margin">
           
          </div>
        </div>
        <div class="row">
          <div class="col-2 footer_logo">
              <p class="imgaling">
                 <img src="../images/train_logo.png"> 
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




<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=09761e7e43faa3cb28b6ebacd17b402e"></script>

	
<script> 
	//마커 이미지의 이미지 주소입니다
	var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
	var markers = [];
	var map = null;	// 지도 오브젝트
	
	// 페이지 로드되자마자 ajax 로 로드
	$(document).ready(function(){
		// 페이지 시작시 맵 로드
		pageInit();
		getCenterList();
	})
	
	function pageInit() {
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
	    mapOption = { 
	        center: new kakao.maps.LatLng(37.4990116, 127.0329081), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };
		map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	}
	
	function deleteAllMarkers() {
		for (var i = 0; i < markers.length; i++) {
			markers[i].setMap(null);
		}
	}
	
/*	
	$("#id_of_textbox").keyup(function(event) {
	    if (event.keyCode === 13) {
	        $("#id_of_button").click();
	    }
	});
*/	
	
	
	// 검색 버튼
	$("#btnSearchSubmit").on("click", function() {
		if($("#searchAddr").val() == ""){
        	alert("검색어를 입력하세요");
        	return;
        }
		fnGetdata(); // 운동종류 넣기
		let data = $("#searchForm").serialize(); // 검색 form 안의 데이터 직렬화	
		$("#searchAddr").val(""); // 입력창 비워주기
		
		$.ajax({
			url : "/getCenterSearchProc.cen"
			, type : "get"
			, dataType : "json"
			, data : data
		}).done(function(response){
			deleteAllMarkers() //마커 제거
			$(".centerBox").empty(); // 센터 리스트 제거
			if (response.success) {
				for (var i = 0; i < response.data.length; i ++) {
				    
				    // 마커 이미지의 이미지 크기 입니다
				    var imageSize = new kakao.maps.Size(24, 35); 
				    
				    // 마커 이미지를 생성합니다    
				    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
				    
				    var gpsPos = new kakao.maps.LatLng(response.data[i].lat, response.data[i].lng)
				    
				    // 마커를 생성합니다
				    var marker = new kakao.maps.Marker({
				        map: map, // 마커를 표시할 지도
				        position: gpsPos, // 마커를 표시할 위치
				        title : response.data[i].center_name, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
				        image : markerImage // 마커 이미지 
				    });
				    
				    markers.push(marker);
				}
				for(let dto of response.data){
				
					let comment =  "<div class='gab_small'></div>"
						+ "<div class='card' style='width: auto;'>"  
		                + "<img class='card-img-top' alt='올바르지 않은 이미지입니다.' src=\"${pageContext.request.contextPath}/" + dto.picAddr + "/" + dto.system_name + "\">"
		                + "<div class='card-body'>"   
		                + "<h5 class='card-title center_name'>" + dto.center_name
		                + "</h5>"      
		                + "<p class='card-text' style='font-size:16px;'>"
		                + "운동분류 : " + dto.exercise 
		                + "</p>"      
		                + "<p class='card-text' style='font-size:16px;'>"
		                + "센터가격 : " + dto.center_price
		                + "</p>"      
		                + "<p class='card-text' style='font-size:16px;'>"
		                + "센터번호 : " + dto.center_tel
		                + "</p>"      
		                + "</div>"    
		                + "</div>"
		                + "<div class='gab_small'></div>"
	    	         // 동적 요소 추가
	    	         $(".centerBox").append(comment);
				}	
			} else {
				alert("검색에 실패했습니다.");
			}		
		}).fail(function(e){
			console.log(e);
			alert("검색에 실패했습니다.");
		});
	});		

	
	function getCenterList(){
		var searchAddr = "";
		var exercise = "";
		searchAddr = $("#searchAddr").val();
		exercise = $("#exercise").val();
				$.ajax({
				type : "get"
				, url : "${pageContext.request.contextPath}/getCenterSearchProc.cen?searchAddr="+searchAddr+"&exercise="+exercise+""
				, dataType : "json" //json형식으로 받기
			}).fail(function(e){
				console.log(e);
			});
		} 
		
		// 운동종류체크박스
		function fnGetdata(){ 
		    let obj = $("[name=SEQ_CHK]");
		    let chkArray = []; // 배열 선언
		
		    $('input:checkbox[name=SEQ_CHK]:checked').each(function() { // 체크된 체크박스의 value 값을 가지고 온다.
		        chkArray.push(this.value);
		    });
		    $('#exercise').val(chkArray);
		    
		    //alert($('#exercise').val()); // 아래 체크박스가 모두 체크되어 있다면 1,2,3,4,5 가 출력 된다.
		};
</script>



</body>

</html>