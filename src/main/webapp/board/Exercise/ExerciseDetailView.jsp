<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>운동 게시글 상세 조회</title>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
	
	
<style>



html, body {
	height: 100%;
}



#title {
	background-color:white;
	width: 100%;
}

textarea {
	background-color:white;
	height: 100%;
	width: 100%;
	resize: none;
}

#board_content {
	background-color:white;
	height: 500px;
}

.board_box {
	background-color:white;
	width: 1200px;
	margin: auto;
}

.subContainer {
	background-color:white;
	text-align: center;
}

.img1 {
	background-color:white;
	height: 50px;
}

.subContainer>.row>.col>button {
	background-color:white;
	border: none;
}

#report_reason{
width:100%;
height:100%;
}

.beforeBox{
	text-align:right;
}

.afterBox{
	display:none;
}

#modify_content{
	display:none;
	width:100%;
	height:500px;
}

.btn-modifyCmtSuc , .btn-modifyCmtCan{
	display:none;
}

.detailImg{
	width:50%;
	height:300px;
}

    	    /*	*{box-sizing: border-box}
    	input {
    		background-color : transparent;
    	} 
    	*/
    	.cls-after{
    		display : none;
    	}
    	
    	
    	* {
	border: 0px solid black;
}

fieldset {
	border: 1px solid black;
}

h2 {
	text-align: center;
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

*{
        box-sizing: border-box;
        margin: 0;
        padding: 0;
        text-decoration: none;
        color: rgb(109, 109, 109);
    }
    
        @import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&display=swap');
            
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
            font-size: 14px;
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
        margin-top: 40px;
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

    .text_gradation_blue {
        font-family: 'Nanum Gothic', sans-serif, ;
        font-weight: bold;
        outline: 3px white;
        background : linear-gradient(to right, rgb(33, 204, 254), rgb(0, 23, 97));
        color: transparent;
        -webkit-background-clip: text;

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
.gab{
    margin-top: 50px;
    margin-bottom: 30px;
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
			<h1 class="display-4 main_copy text_gradation">운동게시글 상세조회</h1>
			<h5 class="img_center">게시판의 글을 상세조회 하실 수 있습니다. </h5>
		</div>
	</div>
</div>

<div class="gab"></div>
	
	
	<form id="ExercisemodifyForm"
		action="${pageContext.request.contextPath}/ExercisemodifyProc.exercisebo"
		method="post">
		<div class="row board_box">
			<div class="col">
				<table class="table table-bordered">
					<tr>
						<th>제목</th>
						<td colspan="5"><input type="text" class="form-control"
							id="title" name="title" value="${dto.getBoard_title()}" readonly></td>
					</tr>

					<tr>
						<th>작성자</th>
						<td><input type="text" class="form-control" id="board_writer"
							name="board_writer" value="${dto.getWriter_nickname()}" readonly></td>
						<th>게시일</th>
						<td><input type="text" class="form-control"
							id="board_written_date" name="board_written_date"
							value="${dto.getWritten_date()}" readonly></td>
						<th>조회수</th>
						<td><input type="text" class="form-control" id="view_count"
							name="view_count" value="${dto.getView_count()}" readonly></td>
					</tr>
					<tr>
						<th>내용</th>
						<td colspan="5">
						<div class="form-control summernote" id="board_content" name="board_content" readonly>
						${dto.getBoard_content()}
						<div>
						<c:if test="${!empty fileDTO.getSystem_name()}">
							<img class="detailImg" src="${pageContext.request.contextPath}/${fileDTO.getPicAddr()}/${fileDTO.getSystem_name()}">
						</c:if>
						</div>
						</div>
						
						<textarea id="modify_content" class="modify_content" name="board_content">${dto.getBoard_content()}</textarea>
						</td>
					</tr>
					
					<tr>
					<!-- 추천,신고 버튼 -->
						<td colspan="12">
						<div class="container subContainer">
					<div class="row">
						<div class="col recommendBox">
							<button type="button" id="btn_recommend">
								<img
									src="https://news.imaeil.com/photos/2018/02/07/2018020710243848707_m.jpg" class="img1">추천
							</button>
							<div class="row">
								<div class="col" style="font-weight:bold">${dto.getRecommended_count()}</div>
							</div>
							
						</div>
						<div class="col">
							<button type="button" id="btnReport" data-bs-toggle="modal"
								data-bs-target="#reportPopup">
								<img
									src="https://i.pinimg.com/736x/57/62/24/5762245c37514d61a333d1d5d1434670.jpg" class="img1">신고
							</button>

							<!-- Modal -->
							<div class="modal fade" id="reportPopup"
								data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
								aria-labelledby="staticBackdropLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="staticBackdropLabel">신고접수</h5>
											<button type="button" class="btn-close"
												data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<div class="modal-body">
											<input type="text" id="report_reason" name="report_reason" placeholder="신고사유를 작성해주세요.">
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-secondary"
												data-bs-dismiss="modal">닫기</button>
											<button type="button" id="btn_reportSubmit" class="btn btn-primary">전송</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				</td>
				</tr>
			</table>
			
			<!-- 게시글 수정, 삭제 버튼 아이디값 임의로 설정하였음.-->
			<c:if test="${loginSession.get('id') eq dto.getId()}">
				<div class="container beforeBox">
					<div class="row">
						<div class="col">
							<button type="button" class="btn btn-danger" id="btn_boardDelete">삭제</button>
							<button type="button" class="btn btn-warning" id="btn_boardModify">수정</button>
						</div>
					</div>
				</div>
			</c:if>
			
			<div class="row afterBox justify-content-center">
			<div class="col-2 d-flex justify-content-end">
				<button type="button" class="btn btn-secondary" id="btn_cancel">취소</button>
			</div>
			<div class="col-2 d-flex justify-content-start">
				<button type="button" class="btn btn-success" id="btn_complete">완료</button>
			</div>
		</div>

		<!-- board_seq, currentPage 히든 처리 -->
			<input type="text" id="board_seq" name="board_seq" value="${dto.getBoard_seq()}" hidden>
            <input type="text" name="currentPage" value="${currentPage}" hidden>
              </div>
			</div>
				</form>
				<br>
	<div class="container comment_container">
		<div class="cmt_box" id="cmt_box">
			<!-- 댓글 -->
		</div>
		<div class="cmt_input"></div>
		<form id="commentForm" method="post">
			<div class="row comment_body m-1">
				<div class="col-10 comment_input">
					<textarea class="form-control comment_content" id="comment_content"
						name="comment_content" placeholder="댓글 입력"></textarea>
				</div>

				<div
					class="col-2 comment_input d-flex align-items-center justify-content-center">
					<button type="button" id="btnSubmitCmt" class="btn btn-primary">등록</button>
					<c:if test="${empty loginSession}">
					<script>
						$("#btnSubmitCmt").on("click",function(){
							alert("로그인이 필요한 기능입니다.");
							location.href="${pageContext.request.contextPath}/home";
						})
					</script>
				</c:if>
				</div>
			</div>

			<!-- currentPage, board_seq 넘겨주는 div (hidden 처리) -->
           	 <input type="text" name="currentPage" value="${currentPage}" hidden>
			 <input type="text" name="board_seq" value="${dto.getBoard_seq()}" hidden>
			 <input type="text" name="report_seq" id="report_seq" hidden>
		</form>
	</div>
	
	
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
	

	<script>
	
	// 추천 버튼 클릭했을 때 이벤트 처리
		let btn_recommend = document.getElementById("btn_recommend");
		let recommendDiv = document.getElementById("recommendDiv");
		
		btn_recommend.addEventListener("click",function(){
			console.log("추천 버튼 클릭");
			location.href = "${pageContext.request.contextPath}/ExerciseRecommendProc.exercisebo?board_seq=${dto.getBoard_seq()}&currentPage=${currentPage}";
		});	
	
	

	// 신고 버튼 클릭 후 전송 눌렀을 때 이벤트 처리
	$(document).ready(function(){
		let btn_reportSubmit = document.getElementById("btn_reportSubmit");
		btn_reportSubmit.addEventListener("click",function(){
			location.href="${pageContext.request.contextPath}/ExercisereportProc.exerciserp?board_seq=${dto.getBoard_seq()}&currentPage=${currentPage}&report_reason="+$("#report_reason").val(); // get 방식으로 넘기기
			// get방식 하기 전엔 form 태그 제출을 안했기 때문에 null 로 넘겨졌음, 근데 굳이 신고사유만 제출한건데 모든 내용이 담긴 form은 전송할 필요가 없어서 get 방식 사용
		})	
	});
	
	// 게시글 수정 버튼 클릭했을 때 이벤트 처리
	$("#btn_boardModify").on("click",function(){
		$(".beforeBox").css("display","none");
		$(".afterBox").css("display","flex");
		$("#title").removeAttr("readonly");
		$("#modify_content").css("display","flex");
		$("#board_content").css("display","none");
	});
	
	// 게시글 수정 버튼 후 완료 버튼 눌렀을 때 이벤트 처리
	let btn_complete = document.getElementById("btn_complete");
	let title = document.getElementById("title");
	let modify_content = document.getElementById("modify_content");
	
	// 욕설 필터링
	let regex_word1 = /[썅|ㅄ]{1}/gm;
	let regex_word2 = /(시.*?발)|(병신.*?)|(씨.*?발)|(존.*?나)|(ㅈ.*?ㄴ)|(ㅅ.*?ㅂ)|(ㅂ.*?ㅅ)/gm;	
	btn_complete.addEventListener("click",function(){
		if(regex_word1.test(title.value)||regex_word2.test(title.value)||regex_word1.test(modify_content.value)||regex_word2.test(modify_content.value)){
			alert("제목이나 내용에 부적절한 언어가 포함되어있습니다.");
			return;}
		else if(title.value == "" || modify_content.value == ""){
			alert("제목 혹은 내용이 공백입니다. 다시 확인해주세요.");
			return;
		}
		document.getElementById("ExercisemodifyForm").submit();
	})
	
	// 게시글 수정 버튼 후 취소 버튼 눌렀을 때 이벤트 처리
	let btn_cancel = document.getElementById("btn_cancel");
	btn_cancel.addEventListener("click",function(){
		location.href = "${pageContext.request.contextPath}/toExerciseDetailView.exercisebo?board_seq=${dto.getBoard_seq()}&currentPage=${currentPage}";
	})
	
	// 게시글 삭제 버튼 클릭했을 때 이벤트 처리
	$("#btn_cancel").on("click",function(){
		let rs = confirm("게시글을 정말 삭제하시겠습니까?");
		if(rs){
			location.href="${pageContext.request.contextPath}/deleteProc.freebo?board_seq=${dto.getBoard_seq()}&currentPage=${currentPage}";	
		}
	});
	
	
	
	// 댓글 등록 
	$(document).ready(function(){
		getCommentList();
		// 댓글 등록 버튼 (btnSubmitCmt) , textarea (comment_content)
		$("#btnSubmitCmt").on("click",function(){
			//욕설 필터링 정규식
			let comment_content = $(".comment_content");
			let regex_word1 = /[썅|ㅄ]{1}/gm;
			let regex_word2 = /(시.*?발)|(병신.*?)|(씨.*?발)|(존.*?나)|(ㅈ.*?ㄴ)|(ㅅ.*?ㅂ)|(ㅂ.*?ㅅ)/gm;			
			if(regex_word1.test(comment_content.val()) || regex_word2.test(comment_content.val())){
				alert("댓글에 부적절한 언어가 포함되어있습니다.");
				return;
			}
			
			let data = $("#commentForm").serialize();
			$("#comment_content").val("");
			$.ajax({
				url : "${pageContext.request.contextPath}/ExerciseinsertProc.exerciseco",
				type : "post",
				data : data
			}).done(function(rs){
			 if(rs =="success"){
					getCommentList();
				}else if(rs == "fail"){
					alert("댓글 등록 실패!");
				}
			}).fail(function(e){
				console.log(e);
			});
		});
	
		// 댓글 목록 출력
		function getCommentList(){
			console.log("abc");
			$.ajax({
				type: "get",
				url : "${pageContext.request.contextPath}/getExerciseCommentProc.exerciseco?board_seq=${dto.getBoard_seq()}",
				dataType : "json"
			}).done(function(data){
				 $("#cmt_box").empty();
				 console.log("456");
				for(let dto of data){
					console.log(dto);
					
					let comment = "<div class='row comment-header m-1'>"
						+ "<div class='col-12 d-flex justify-content-start cmt-info'>"
						+ dto.writer_nickname
						+ "</div>"
						+ "<div class='col-12 d-flex justify-content-start cmt-info'>"
						+ dto.written_date
						+ "</div>"
						+ "<div class='col-10 d-flex justify-content-start contentDiv-cmt'>"
						+ "<textarea class='content-cmt form-control' name='comment_content' readonly>"
						+ dto.comment_content
						+"</textarea>"
						+"</div>"
						+"</div>";
						$("#cmt_box").append(comment);
						
					// 댓글 수정 삭제 버튼 영역
					if(dto.writer_id == "${loginSession.get('id')}"){
						let btns = "<div class='col-1' d-flex justify-content-center'>"
			          	+ "<button type='button' id='btn_commentModify' class='btn btn-modifyCmt' value='" + dto.comment_seq +"'>수정</button>"
			          	+ "<button type='button' class='btn btn-modifyCmtSuc' value='" + dto.comment_seq + "'>완료</button>"
		          		+ "<button type='button' id='btn_commentDelete' class='btn btn-deleteCmt' value='" + dto.comment_seq + "'>삭제</button>"
		          		+ "<button type='button' class='btn btn-modifyCmtCan' value='" + dto.comment_seq + "'>취소</button>"
		          		+ "</div>";

		          		$(".contentDiv-cmt:last").after(btns);
						}
					}
			}).fail(function(e){
				console.log(e);
			});
		};
		
		// 댓글 수정 버튼 누르고 완료 버튼 눌렀을 때
		$(document).on("click",".btn-modifyCmtSuc",function(e){
			let comment_content = $(e.target).parents(".comment-header").children(".contentDiv-cmt").children("textarea").val(); // 변수로 담음
			
			//욕설 필터링
			let regex_word1 = /[썅|ㅄ]{1}/gm;
			let regex_word2 = /(시.*?발)|(병신.*?)|(씨.*?발)|(존.*?나)|(ㅈ.*?ㄴ)|(ㅅ.*?ㅂ)|(ㅂ.*?ㅅ)/gm;
			if(regex_word1.test(comment_content) || regex_word2.test(comment_content)){
				alert("댓글에 부적절한 언어가 포함되어있습니다.");
				return;
			}
			$.ajax({
				url:"${pageContext.request.contextPath}/ExercisemodifyProc.exerciseco?comment_seq=" + $(e.target).val() + "&comment_content=" + comment_content ,
				type:"get"
			}).done(function(rs){
				if(rs=="success"){
					getCommentList();
				}else if(rs=="fail"){
					alert("댓글 수정에 실패하였습니다.");
				}
			}).fail(function(e){
				console.log(e);
			});
		
		})
		
		let origin_content;
		
		// 댓글 수정 버튼 클릭 시 완료랑 취소 버튼 띄우기 (readonly 해제)
		$(document).on("click",".btn-modifyCmt",function(e){
			console.log("댓글 수정 버튼 클릭");
			origin_content = $(e.target).parents(".comment-header").children(".contentDiv-cmt").children("textarea").val();
			console.log($(e.target).siblings(".btn-modifyCmtSuc").val()); // console로 값 잘 찾아오는지 확인
			
			// $(e.target).siblings(".btn-modifyCmtSuc")
			$(e.target).parents(".comment-header").children(".contentDiv-cmt").children("textarea").attr("readonly",false);
			
			$(e.target).css("display","none");
			$(e.target).siblings(".btn-deleteCmt").css("display","none");
			
			$(e.target).siblings(".btn-modifyCmtSuc").css("display","flex"); //완료 버튼
			$(e.target).siblings(".btn-modifyCmtCan").css("display","flex"); // 취소 버튼

		});
		
		// 댓글 수정 버튼 누르고 취소 버튼 눌렀을 때
		$(document).on("click",".btn-modifyCmtCan",function(e){
			console.log("댓글 수정 취소 버튼 클릭");
			$(e.target).parents(".comment-header").children(".contentDiv-cmt").children("textarea").val(origin_content); // 취소 눌렀을 때 수정전 텍스트로 지정;

			$(e.target).parents(".comment-header").children(".contentDiv-cmt").children("textarea").attr("readonly",true);
			$(e.target).siblings(".btn-modifyCmt").css("display","flex"); // 수정 버튼
			$(e.target).siblings(".btn-deleteCmt").css("display","flex"); // 삭제 버튼

			$(e.target).siblings(".btn-modifyCmtSuc").css("display","none"); //완료 버튼
			$(e.target).css("display","none"); // 취소 버튼
		})

		
		// 댓글 삭제 버튼 클릭 시 이벤트 처리
		$(document).on("click","#btn_commentDelete",function(e){
			console.log("댓글 삭제 버튼 클릭");
			$.ajax({
				url:"${pageContext.request.contextPath}/ExercisedeleteProc.exerciseco?comment_seq=" + $(e.target).val(),
				type : 'get'
			}).done(function(rs){
				if(rs=="success"){
					let rs = confirm("정말 댓글을 삭제하시겠습니까?");
					if(rs){
						getCommentList();	
					}
				}else if(rs =="fail"){
					alert("댓글 삭제에 실패했습니다.");
				}
			}).fail(function (e){
				console.log(e);
			});
		});
	});
	
	</script>
</body>
</html>