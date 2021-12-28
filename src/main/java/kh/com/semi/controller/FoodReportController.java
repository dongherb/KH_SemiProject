package kh.com.semi.controller;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.com.semi.dao.FoodBoardDAO;
import kh.com.semi.dao.FoodReportDAO;
import kh.com.semi.dto.FoodReportDTO;

@WebServlet("*.foodrp")
public class FoodReportController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		actionDo(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		actionDo(request, response);
	}

	private void actionDo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		FoodReportDAO dao = new FoodReportDAO();
		FoodReportDTO dto = new FoodReportDTO();
		
		String url = request.getRequestURI();
		String ctxPath = request.getContextPath();
		String cmd = url.substring(ctxPath.length());
		System.out.println("요청 URL : " + cmd);
		
		if (cmd.equals("/FoodreportProc.foodrp")) {
			System.out.println("신고 접수 요청 도착");
			int board_seq = Integer.parseInt(request.getParameter("board_seq"));
			int currentPage =Integer.parseInt(request.getParameter("currentPage"));
			System.out.println("신고 요청된 게시글 번호 : " + board_seq);
			
			FoodBoardDAO boardDAO = new FoodBoardDAO();
			int minus = boardDAO.minusView_count(board_seq);
					
			
			String report_reason = request.getParameter("report_reason");
			System.out.println("신고 사유 : " + report_reason);
			int report_count = 0;
			int rs = dao.insertReport(new FoodReportDTO(0,report_reason,report_count,board_seq));
			if(rs!=-1 && minus!=-1) {
				dao.plusReport_count(board_seq);
				response.sendRedirect("/toFoodDetailView.foodbo?board_seq="+board_seq + "&currentPage=" +  currentPage);
			}
				
		}

	}

}
