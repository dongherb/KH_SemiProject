package kh.com.semi.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import kh.com.semi.dao.WorryCommentDAO;
import kh.com.semi.dto.WorryCommentDTO;

@WebServlet("*.worryco")
public class WorryCommentController extends HttpServlet {

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
		WorryCommentDAO dao = new WorryCommentDAO();
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String url = request.getRequestURI();
		String ctxPath = request.getContextPath();
		String cmd = url.substring(ctxPath.length());
		System.out.println("요청한 URL : " + cmd);

		if (cmd.equals("/WorryinsertProc.worryco")) {
			System.out.println("댓글 등록 요청 도착");
			// int currentPage = Integer.parseInt(request.getParameter("currentPage"));
			int board_seq = Integer.parseInt(request.getParameter("board_seq"));
			String comment_content = request.getParameter("comment_content");

			HashMap<String, String> map = (HashMap) session.getAttribute("loginSession");
			String id = map.get("id");
			String nickname = map.get("nickname");
			int rs = dao.insertComment(new WorryCommentDTO(0, nickname, comment_content, null, board_seq, id));
			if (rs == 1) {
				response.getWriter().write("success");
				System.out.println("댓글 등록 성공");
			} else {
				response.getWriter().write("fail");
			}
		} else if (cmd.equals("/getWorryCommentProc.worryco")) {
			System.out.println("댓글 조회 요청 도착");
			int board_seq = Integer.parseInt(request.getParameter("board_seq"));
			System.out.println("board_seq : " + board_seq);
			ArrayList<WorryCommentDTO> commentList = dao.getCommentList(board_seq);

			Gson gson = new Gson();
			String rs = gson.toJson(commentList);
			// System.out.println(rs);
			response.getWriter().write(rs);
		} else if (cmd.equals("/WorrydeleteProc.worryco")) {
			System.out.println("댓글 삭제 요청 도착");
			int comment_seq = Integer.parseInt(request.getParameter("comment_seq"));
			int rs = dao.deleteComment(comment_seq);
			if(rs==1) {
				response.getWriter().write("success");
			}else {
				response.getWriter().write("fail");
			}
		} else if(cmd.equals("/WorrymodifyProc.worryco")) {
			System.out.println("댓글 수정 요청 도착");
			int comment_seq = Integer.parseInt(request.getParameter("comment_seq"));
			
			String comment_content = request.getParameter("comment_content");
			System.out.println("target.val 테스트 : " + comment_seq);
			System.out.println("수정 테스트 : " + comment_content);
			int rs = dao.modifyComment(comment_seq,comment_content);
			if(rs ==1) {
				response.getWriter().write("success");
			}else {
				response.getWriter().write("fail");
			}
		}
	}

}
