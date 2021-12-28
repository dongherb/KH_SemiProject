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

import kh.com.semi.dao.FoodBoardDAO;
import kh.com.semi.dao.FoodFileDAO;
import kh.com.semi.dto.FoodBoardDTO;
import kh.com.semi.dto.FoodFileDTO;
import kh.com.semi.service.FoodBoardService;

@WebServlet("*.foodbo")
public class FoodBoardController extends HttpServlet {

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
		FoodBoardDAO dao = new FoodBoardDAO();
		
		String url = request.getRequestURI();
		String ctxPath = request.getContextPath();
		String cmd = url.substring(ctxPath.length());
		System.out.println("요청한 URL : " + cmd);
		
		if(cmd.equals("/toFoodBoard.foodbo")) { // 데이터 받으려면 toFoodBoard.foodbo 타서 가야함.
			int currentPage = Integer.parseInt(request.getParameter("currentPage"));
			System.out.println("currentPage : " + currentPage);
			HashMap<String, String> map = (HashMap) session.getAttribute("loginSession");
			//String id = map.get("id");
			
			FoodBoardService service = new FoodBoardService();
			HashMap<String,Object> naviMap = service.getPageNavi(currentPage);
			ArrayList<FoodBoardDTO> list = service.getBoardList((int)naviMap.get("currentPage"));
			System.out.println("test.jsp의 요청");
			ArrayList<FoodBoardDTO> dtoList = dao.selectAll();
			request.setAttribute("dtoList", dtoList);

			  if(list!=null) {
				RequestDispatcher rd = request.getRequestDispatcher("/board/Food/FoodBoard.jsp");
				request.setAttribute("naviMap", naviMap);
				request.setAttribute("list",list);
				rd.forward(request, response);
			} 
			 
		}
		else if(cmd.equals("/toFoodWrite.foodbo")) {
			response.sendRedirect("/board/Food/FoodWrite.jsp");
		}else if(cmd.equals("/FoodwriteProc.foodbo")) {
			String folderName = "files"; 
			String filePath = request.getServletContext().getRealPath(folderName); //~~에 있는 files라는 폴더 , html 에서 쓴다면 ${pageContext.request.contextPath}()같은 느낌
			System.out.println("filePath : " + filePath);
			File dir = new File(filePath);
			if (!dir.exists())
				dir.mkdir();
			int fileSize = 1024 * 1024 * 10;
			
			HashMap<String, String> map = (HashMap) session.getAttribute("loginSession");
			String id = map.get("id");
			String writer_nickname = map.get("nickname"); // 나중에 수정해야함 임의 값 지정한 것임
			String board_category ="식단";
			try {
				MultipartRequest multi = new MultipartRequest(request,filePath,fileSize,"utf-8",
						new DefaultFileRenamePolicy());
				
				String board_title = multi.getParameter("title");
				String board_content = multi.getParameter("board_content");
				
				int rs = dao.insert(new FoodBoardDTO(0,writer_nickname,board_title,board_content,null,0,0,board_category,id));
				int board_seq = dao.getBoardSeq();
				System.out.println("보드 시퀀스 확인입니다." + board_seq);
				
				String origin_name = multi.getOriginalFileName("file");
				String system_name = multi.getFilesystemName("file");
				FoodFileDAO daoFile = new FoodFileDAO();
				int rsFile = daoFile.insertFile(board_seq,origin_name,system_name,folderName);
				if(rs!=-1 || rsFile !=-1) {
					response.sendRedirect("/toFoodBoard.foodbo?currentPage=1");
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
		}else if(cmd.equals("/toFoodDetailView.foodbo")){
			int board_seq = Integer.parseInt(request.getParameter("board_seq"));
			int currentPage = Integer.parseInt(request.getParameter("currentPage"));
			System.out.println("게시글 번호 : " + board_seq);
			System.out.println("currentPage : " + currentPage);
			// 파일을 띄우기만 할거면 origin name은 굳이 필요가 없음. 저장된 이름만 알면 괜찮다.
			// 조회수 + 해주는 메서드 호출
			FoodFileDAO fileDAO = new FoodFileDAO();
			FoodFileDTO fileDTO = new FoodFileDTO();
			dao.plusView_count(board_seq);
			FoodBoardDTO dto = dao.selectBySeq(board_seq);
			if(dto!= null) {
				fileDTO = fileDAO.getFileNames(board_seq);
				// System.out.println("여기부터는 파일 영역입니다 : " + fileDTO.getSystem_name());
				request.setAttribute("fileDTO", fileDTO);
				RequestDispatcher rd = request.getRequestDispatcher("/board/Food/FoodDetailView.jsp");
				request.setAttribute("currentPage", currentPage);
				request.setAttribute("dto", dto);
				rd.forward(request,response);
			}
		}else if(cmd.equals("/FooddeleteProc.foodbo")) {
			System.out.println("삭제 요청 도착");
			int board_seq = Integer.parseInt(request.getParameter("board_seq"));
			System.out.println("삭제 요청된 게시글 번호 : " + board_seq);
			
			int rs = dao.deleteBySeq(board_seq);
			if(rs!=-1) {
				response.sendRedirect("/toFoodBoard.foodbo?currentPage=1");
			}
		}else if(cmd.equals("/FoodmodifyProc.foodbo")) {
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
				response.sendRedirect("/toFoodDetailView.foodbo?board_seq=" + board_seq +"&currentPage=" + currentPage);
			}
		}else if (cmd.equals("/FoodRecommendProc.foodbo")) {
			System.out.println("추천요청 도착");
			int currentPage = Integer.parseInt(request.getParameter("currentPage"));
			int board_seq = Integer.parseInt(request.getParameter("board_seq"));
			int rs = dao.plusRecommended_count(board_seq);
			int minus = dao.minusView_count(board_seq);
			System.out.println("추천수 카운트 : " + rs);
			if(rs!=-1 && minus !=-1) {
				response.sendRedirect("/toFoodDetailView.foodbo?board_seq=" + board_seq +"&currentPage=" + currentPage);
			}
		}
	}
	

}
