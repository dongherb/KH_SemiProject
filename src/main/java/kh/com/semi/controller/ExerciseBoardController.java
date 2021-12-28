package kh.com.semi.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kh.com.semi.dao.ExerciseBoardDAO;
import kh.com.semi.dao.ExerciseFileDAO;
import kh.com.semi.dto.ExerciseBoardDTO;
import kh.com.semi.dto.ExerciseFileDTO;
import kh.com.semi.service.ExerciseBoardService;

@WebServlet("*.exercisebo")
public class ExerciseBoardController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		actionDo(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		actionDo(request, response);
	}

private void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		ExerciseBoardDAO dao = new ExerciseBoardDAO();
		
		String url = request.getRequestURI();
		String ctxPath = request.getContextPath();
		String cmd = url.substring(ctxPath.length());
		System.out.println("요청한 URL : " + cmd);
		
		if(cmd.equals("/toExerciseBoard.exercisebo")) { // 데이터 받으려면 toExerciseBoard.exercisebo 타서 가야함.
			int currentPage = Integer.parseInt(request.getParameter("currentPage"));
			System.out.println("currentPage : " + currentPage);
			HashMap<String, String> map = (HashMap) session.getAttribute("loginSession");
			// String id = map.get("id");
			
			ExerciseBoardService service = new ExerciseBoardService();
			HashMap<String,Object> naviMap = service.getPageNavi(currentPage);
			ArrayList<ExerciseBoardDTO> list = service.getBoardList((int)naviMap.get("currentPage"));
			
			System.out.println("test.jsp의 요청");
			ArrayList<ExerciseBoardDTO> dtoList = dao.selectAll();
			request.setAttribute("dtoList", dtoList);

			  if(list!=null) {
				RequestDispatcher rd = request.getRequestDispatcher("/board/Exercise/ExerciseBoard.jsp");
				request.setAttribute("naviMap", naviMap);
				request.setAttribute("list",list);
				rd.forward(request, response);
			} 
			 
		}
		else if(cmd.equals("/toExerciseWrite.exercisebo")) {
			response.sendRedirect("/board/Exercise/ExerciseWrite.jsp");
		}else if(cmd.equals("/ExercisewriteProc.exercisebo")) {
			String folderName = "files"; 
			String filePath = request.getServletContext().getRealPath(folderName); //~~에 있는 files라는 폴더 , html 에서 쓴다면 ${pageContext.request.contextPath}()같은 느낌
			System.out.println("filePath : " + filePath);
			File dir = new File(filePath);
			if (!dir.exists())
				dir.mkdir();
			int fileSize = 1024 * 1024 * 10;
			////
			HashMap<String, String> map = (HashMap) session.getAttribute("loginSession");
			String id = map.get("id");
			String writer_nickname = map.get("nickname"); // 나중에 수정해야함 임의 값 지정한 것임
			String board_category ="운동";
			try {
				MultipartRequest multi = new MultipartRequest(request,filePath,fileSize,"utf-8",
						new DefaultFileRenamePolicy());
				
				String board_title = multi.getParameter("title");
				String board_content = multi.getParameter("board_content");
				
				int rs = dao.insert(new ExerciseBoardDTO(0,writer_nickname,board_title,board_content,null,0,0,board_category,id));
				int board_seq = dao.getBoardSeq();
				System.out.println("보드 시퀀스 확인입니다." + board_seq);
				
				String origin_name = multi.getOriginalFileName("file");
				String system_name = multi.getFilesystemName("file");
				ExerciseFileDAO daoFile = new ExerciseFileDAO();
				int rsFile = daoFile.insertFile(board_seq,origin_name,system_name,folderName);
				if(rs!=-1 || rsFile !=-1) {
					response.sendRedirect("/toExerciseBoard.exercisebo?currentPage=1");
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
		}else if(cmd.equals("/toExerciseDetailView.exercisebo")){
			int board_seq = Integer.parseInt(request.getParameter("board_seq"));
			int currentPage = Integer.parseInt(request.getParameter("currentPage"));
			System.out.println("게시글 번호 : " + board_seq);
			System.out.println("currentPage : " + currentPage);
			// 파일을 띄우기만 할거면 origin name은 굳이 필요가 없음. 저장된 이름만 알면 괜찮다.
			// 조회수 + 해주는 메서드 호출
			ExerciseFileDAO fileDAO = new ExerciseFileDAO();
			ExerciseFileDTO fileDTO = new ExerciseFileDTO();
			dao.plusView_count(board_seq);
			ExerciseBoardDTO dto = dao.selectBySeq(board_seq);
			if(dto!= null) {
				fileDTO = fileDAO.getFileNames(board_seq);
				// System.out.println("여기부터는 파일 영역입니다 : " + fileDTO.getSystem_name());
				request.setAttribute("fileDTO", fileDTO);
				RequestDispatcher rd = request.getRequestDispatcher("/board/Exercise/ExerciseDetailView.jsp");
				request.setAttribute("currentPage", currentPage);
				request.setAttribute("dto", dto);
				rd.forward(request,response);
			}
		}else if(cmd.equals("/ExercisedeleteProc.exercisebo")) {
			System.out.println("삭제 요청 도착");
			int board_seq = Integer.parseInt(request.getParameter("board_seq"));
			System.out.println("삭제 요청된 게시글 번호 : " + board_seq);
			
			int rs = dao.deleteBySeq(board_seq);
			if(rs!=-1) {
				response.sendRedirect("/toExerciseBoard.exercisebo?currentPage=1");
			}
		}else if(cmd.equals("/ExercisemodifyProc.exercisebo")) {
			System.out.println("수정 요청 도착");
			int currentPage = Integer.parseInt(request.getParameter("currentPage"));
			int board_seq = Integer.parseInt(request.getParameter("board_seq"));
			String title = request.getParameter("title");
			String board_content = request.getParameter("board_content");
			System.out.println("board_seq : " + board_seq);
			System.out.println("title : " + title);
			System.out.println("board_content : " + board_content);
			int rs = dao.modifyBySeq(board_seq, title, board_content);
			if(rs!=-1) {
				response.sendRedirect("/toExerciseDetailView.exercisebo?board_seq=" + board_seq +"&currentPage=" + currentPage);
			}
		}else if (cmd.equals("/ExerciseRecommendProc.exercisebo")) {
			System.out.println("추천요청 도착");
			int currentPage = Integer.parseInt(request.getParameter("currentPage"));
			int board_seq = Integer.parseInt(request.getParameter("board_seq"));
			int rs = dao.plusRecommended_count(board_seq);
			int minus = dao.minusView_count(board_seq);
			System.out.println("추천수 카운트 : " + rs);
			if(rs!=-1 && minus !=-1) {
				response.sendRedirect("/toExerciseDetailView.exercisebo?board_seq=" + board_seq +"&currentPage=" + currentPage);
			}
		}
	}
	

}
