package kh.com.semi.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kh.com.semi.dao.CenterDAO;
import kh.com.semi.dao.CenterPicDAO;
import kh.com.semi.dao.MemberDAO;
import kh.com.semi.dto.CenterDTO;
import kh.com.semi.dto.CenterPicDTO;
import kh.com.semi.dto.CenterSearchDTO;
import kh.com.semi.dto.KaKaoLocalResultDTO;
import kh.com.semi.utils.Tools;

@WebServlet("*.cen")
public class CenterController extends HttpServlet {

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
		// 기본설정
		request.setCharacterEncoding("utf-8");
		CenterDAO dao = new CenterDAO();
		CenterPicDAO CPdao = new CenterPicDAO();
		MemberDAO Mdao = new MemberDAO();
		HttpSession session = request.getSession();

		// 클라이언트로부터 온 요청값을 분리
		String uri = request.getRequestURI();
		String ctxPath = request.getContextPath();
		String cmd = uri.substring(ctxPath.length());
		System.out.println("요청 uri : " + cmd);

		if (cmd.equals("/toCenterSignup.cen")) { ///// 센터등록페이지
			String business_no = request.getParameter("business_no");
			boolean rs = dao.checkCenter(business_no);
			
			RequestDispatcher rd = request.getRequestDispatcher("/center/centerSignup.jsp");
			if(rs) { 
				request.setAttribute("rs", "false"); //센터가 존재하면 false
			}else {  
				request.setAttribute("business_no", business_no); //센터가 존재하지않는다면 business_no
			}
			rd.forward(request, response);
		} else if (cmd.equals("/centerSignupProc.cen")) { ///// 센터등록페이지
			System.out.println("요청 도착");
			String folderName = "profile";
			String filePath = request.getServletContext().getRealPath(folderName); // realPath경로에 folderName라는 폴더 생성
			System.out.println("filePath : " + filePath);
			File dir = new File(filePath);
			if (!dir.exists()) {
				dir.mkdir();
			}
			int fileSize = 1024 * 1024 * 10;
			try {
				MultipartRequest multi = new MultipartRequest(request, filePath, fileSize, "utf-8",
						new DefaultFileRenamePolicy());

				String center_name = multi.getParameter("center_name");
				int center_price = Integer.parseInt(multi.getParameter("center_price"));
				String exercise = multi.getParameter("exercise");
				String center_tel = multi.getParameter("center_tel");
				int postcode = Integer.parseInt(multi.getParameter("postCode"));
				String detailAddr = multi.getParameter("detailAddr");
				String roadAddr = multi.getParameter("roadAddr");
				String extraAddr = multi.getParameter("extraAddr");
				String business_no = multi.getParameter("business_no");
				KaKaoLocalResultDTO kakaoDTO = dao.getKakaoLocalSearch(roadAddr);
				Double lat = kakaoDTO.getLat();
				Double lng = kakaoDTO.getLng();
				int rs = dao.insert(new CenterDTO(0, center_name, center_price, exercise, center_tel, postcode,
						detailAddr, roadAddr, extraAddr, business_no, lat, lng));
				if (rs != -1) { // 센터등록 완료하면
					CenterDTO dto = dao.selectByBn(business_no);
					int center_seq = dto.getCenter_seq();
					String origin_name = multi.getOriginalFileName("center_profile");
					String system_name = multi.getFilesystemName("center_profile");
					int rs2 = CPdao.insertCenterPic(new CenterPicDTO(0, center_seq, origin_name, system_name, folderName));
					if (rs2 != -1) {
						System.out.println("센터등록완료");
						response.sendRedirect("/home"); 
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (cmd.equals("/pwCheckPopup.cen")) { // 비밀번호 확인 팝업창 페이지
			System.out.println("비밀번호 확인 팝업 페이지 요청");
			response.sendRedirect("/center/pwCheckPopup.jsp");
		} else if (cmd.equals("/pwCheckProc.cen")) { // 비밀번호 중복확인 팝업창 체크
			HashMap<String, String> map = (HashMap) session.getAttribute("loginSession");
			String id = map.get("id");
			String pwInput = request.getParameter("pwInput");
			boolean rs = Mdao.isLoginOk(id, pwInput); // 비밀번호 확인을 위해 isLoginOK 재사용
			RequestDispatcher rd = request.getRequestDispatcher("/center/pwCheckPopup.jsp");
			if (rs) {
				request.setAttribute("rs", "true");
			} else {
				request.setAttribute("rs", "false");
			}
			rd.forward(request, response);
		} else if (cmd.equals("/toCenterPage.cen")) { ///// 마이페이지 요청

			String business_no = request.getParameter("business_no");
			CenterDTO dto = dao.selectByBn(business_no);
			CenterPicDTO CPdto = CPdao.getFileNames(dto.getCenter_seq());
				
			RequestDispatcher rd = request.getRequestDispatcher("/center/centerPage.jsp");		
			if (dto != null && CPdto != null) {
				request.setAttribute("dto", dto);
				request.setAttribute("CPdto", CPdto);	
			}else {
				request.setAttribute("rs", "false");
			}
			rd.forward(request, response);
			
		} else if (cmd.equals("/centerModifyProc.cen")) { //// 센터정보수정
			try {
				System.out.println("요청 도착");
				String business_no = request.getParameter("business_no");
				int center_seq = Integer.parseInt(request.getParameter("center_seq"));
				String center_name = request.getParameter("center_name");
				int center_price = Integer.parseInt(request.getParameter("center_price"));
				String exercise = request.getParameter("exercise");
				String center_tel = request.getParameter("center_tel");
				int postcode = Integer.parseInt(request.getParameter("postCode"));
				String detailAddr = request.getParameter("detailAddr");
				String roadAddr = request.getParameter("roadAddr");
				String extraAddr = request.getParameter("extraAddr");
				KaKaoLocalResultDTO kakaoDTO = dao.getKakaoLocalSearch(roadAddr);
				Double lat = kakaoDTO.getLat();
				Double lng = kakaoDTO.getLng();
				int rs = dao.modifyByBn(new CenterDTO(0, center_name, center_price, exercise, center_tel, postcode,
						detailAddr, roadAddr, extraAddr, business_no, lat, lng));
				if (rs != -1) {
					System.out.println("센터수정완료");
					response.sendRedirect("/toCenterPage.cen?business_no=" + business_no); // 센터정보페이지로
				}
			}catch(Exception e) {
				e.printStackTrace();
			}		

		} else if (cmd.equals("/toCenterSearch.cen")) { ///// 센터검색페이지
			response.sendRedirect("/center/centerSearch.jsp");
		} else if (cmd.equals("/getCenterSearchProc.cen")) {

			String searchAddr = Tools.checkNull(request.getParameter("searchAddr"));
			String searchExercise = Tools.checkNull(request.getParameter("exercise"));
			String orderBy = Tools.checkNull(request.getParameter("orderBy"));
			System.out.println("searchAddr : " + searchAddr);
			ArrayList<CenterSearchDTO> list = dao.getCenterList(searchAddr, searchExercise, orderBy);
			// reponse map 생성
			Map<String, Object> responseMap = new HashMap<>();
			responseMap.put("success", true);
			responseMap.put("data", list);

			// list 를 json 형식으로 변환
			Gson gson = new Gson(); // json 객체 생성
			String rs = gson.toJson(responseMap); // json에 list룰 담고 String형 rs 변수에 넣기
			System.out.println(rs);
			response.setContentType("text/html;charset=UTF-8");
			response.setContentType("application/json");

			if (list != null) {
				response.getWriter().write(rs);
				// success 문자열을 반환
			} else {
				response.getWriter().write("fail");
				// fail 문자열을 반환
			}
		}

	}
}
