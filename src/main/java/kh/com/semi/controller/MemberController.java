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

import kh.com.semi.dao.BusinessFileDAO;
import kh.com.semi.dao.MemberDAO;
import kh.com.semi.dto.BusinessFileDTO;
import kh.com.semi.dto.FreeBoardDTO;
import kh.com.semi.dto.MemberDTO;
import kh.com.semi.service.MyPageService;

@WebServlet("*.mem")
public class MemberController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}

	private void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//공통설정
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		MemberDAO dao = new MemberDAO();
		String uri = request.getRequestURI();
		String ctxPath = request.getContextPath();
		String cmd = uri.substring(ctxPath.length());
		System.out.println("요청 URL : "+ cmd);		
		
		if(cmd.equals("/toLogin.mem")) {// 로그인 페이지
			System.out.println("로그인 페이지 요청");
			response.sendRedirect("/member/login.jsp"); // member폴더 login.jsp 
		}else if(cmd.equals("/")) {	// 아이디 찾기 페이지 이동
			System.out.println("아이디 찾기 페이지 요청");			
			response.sendRedirect("/member/seachId.jsp");
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			
		}else if(cmd.equals("/toSignup.mem")) { //회원가입 선택
			System.out.println("회원가입 페이지 요청");
			response.sendRedirect("/member/selectSignup.jsp"); //회원가입 종류 선택 페이지
		}else if(cmd.equals("/toGeneralSignupProc.mem")) { //일반회원 가입 페이지
			System.out.println("일반회원 회원가입 페이지 요청");
			response.sendRedirect("/member/generalSignup.jsp");
		}else if(cmd.equals("/toBusinessSignupProc.mem")) { //사업자회원 가입 페이지
			System.out.println("사업자 회원가입 페이지 요청");
			response.sendRedirect("/member/businessSignup.jsp");
		}else if(cmd.equals("/idCheckPopup.mem")) { //아이디 중복확인 팝업창 페이지
			System.out.println("아이디 중복확인 팝업 페이지 요청");
			response.sendRedirect("/member/idCheckPopup.jsp");
		}else if(cmd.equals("/idCheckProc.mem")) { //아이디 중복확인 팝업창 체크
			String idInput = request.getParameter("idInput");
			System.out.println("id : " + idInput);
			boolean rs = dao.checkId(idInput);
			RequestDispatcher rd = request.getRequestDispatcher("/member/idCheckPopup.jsp");
			request.setAttribute("idInput", idInput);
			if(rs) { 
				request.setAttribute("rs", "unavailable");
			}else {
				request.setAttribute("rs", "available");
			}
			rd.forward(request, response);
		}else if(cmd.equals("/bnCheckPopup.mem")) { //사업자번호 중복확인 팝업창 페이지
			System.out.println("사업자번호 중복확인 팝업 페이지 요청");
			response.sendRedirect("/member/bnCheckPopup.jsp");
		}else if(cmd.equals("/bnCheckProc.mem")) { //사업자번호 중복확인 팝업창 체크
			String bnInput = request.getParameter("bnInput");
			System.out.println("business_no : " + bnInput);
			boolean rs = dao.checkBn(bnInput);
			RequestDispatcher rd = request.getRequestDispatcher("/member/bnCheckPopup.jsp");
			request.setAttribute("bnInput", bnInput);
			if(rs) { 
				request.setAttribute("rs", "unavailable");
			}else {
				request.setAttribute("rs", "available");
			}
			rd.forward(request, response);
		}else if(cmd.equals("/pwCheckPopup.mem")) { //비밀번호 확인 팝업창 페이지
			System.out.println("비밀번호 확인 팝업 페이지 요청");
			response.sendRedirect("/member/pwCheckPopup.jsp");
		}else if(cmd.equals("/pwCheckProc.mem")) { //비밀번호 중복확인 팝업창 체크
			HashMap<String,String> map = (HashMap)session.getAttribute("loginSession");
			String id = map.get("id");
			String pwInput = request.getParameter("pwInput");
			boolean rs = dao.isLoginOk(id,pwInput); // 비밀번호 확인을 위해 isLoginOK 재사용 
			RequestDispatcher rd = request.getRequestDispatcher("/member/pwCheckPopup.jsp");
			if(rs) { 
				request.setAttribute("rs", "true");
			}else {
				request.setAttribute("rs", "false");
			}
			rd.forward(request, response);
		}else if(cmd.equals("/generalSignupProc.mem")) { //일반회원 가입신청
			String id = request.getParameter("id");
			String password = request.getParameter("password");
			String name = request.getParameter("name");
			String nickname = request.getParameter("nickname");
			String phone = request.getParameter("phone");
			String email = request.getParameter("email");		
			int postCode = Integer.parseInt(request.getParameter("postCode"));
			String detailAddr = request.getParameter("detailAddr");
			String roadAddr = request.getParameter("roadAddr");
			String extraAddr = request.getParameter("extraAddr");
			String member_category = request.getParameter("member_category");
//			String business_no = request.getParameter("business_no");
//			int center_seq = Integer.parseInt(request.getParameter("center_seq"));
//			Date signup_date = request.getParameter("signup_date");
				
			int rs = dao.insert(new MemberDTO(id, password, name, nickname, phone, email, postCode, detailAddr, roadAddr, extraAddr, null, null, 0, null));
			if(rs != -1) response.sendRedirect("/home");
			
			//회원가입 값 출력
			System.out.println(id + " : " + password + " : " + name + " : " + nickname + " : " 
								+ phone + " : " + email + " : " + postCode + " : " 
								+ detailAddr + " : " + roadAddr + " : " + extraAddr + " : " + member_category); 
			
			
		}else if (cmd.equals("/businessSignupProc.mem")) { //사업자회원 가입신청
			System.out.println("사업자 회원가입 페이지 도착");
			String folderName = "BusinessFile";
			String  BusinessFilePath = request.getServletContext().getRealPath(folderName);
			System.out.println("BusinessFilePath : " + BusinessFilePath);
	
			BusinessFileDAO daoFile = new BusinessFileDAO();
		
			File dir = new File(BusinessFilePath);
			if(!dir.exists()) {
				dir.mkdir(); 
			}
			
			int fileSize = 1024*1024*10;
			
			try{
				MultipartRequest multi = new MultipartRequest(request, BusinessFilePath, fileSize, "utf-8", new DefaultFileRenamePolicy());
				
				String id = multi.getParameter("id");
				String password = multi.getParameter("password");
				String name = multi.getParameter("name");
				String nickname = multi.getParameter("nickname");
				String phone = multi.getParameter("phone");
				String email = multi.getParameter("email");
				int postCode = Integer.parseInt(multi.getParameter("postCode"));
				String detailAddr = multi.getParameter("detailAddr");
				String roadAddr = multi.getParameter("roadAddr");
				String extraAddr = multi.getParameter("extraAddr");
				String business_no = multi.getParameter("business_no");
//				int center_seq = Integer.parseInt(request.getParameter("center_seq"));
//				Date signup_date = request.getParameter("signup_date");
				
				
				String businessFile = multi.getParameter("businessFile");
				System.out.println("businessFile : " + businessFile);
				String origin_name = multi.getOriginalFileName("businessFile");
				String system_name = multi.getFilesystemName("businessFile");
				System.out.println(origin_name + " : " + system_name);
				int rsFile = daoFile.insertBusinessFile(id, origin_name,system_name,folderName);

				
				//회원가입 값 출력
				System.out.println(id + " : " + password + " : " + name + " : " + nickname + " : " + phone + " : " + email + " : " + postCode 
									+ " : " + detailAddr + " : " + roadAddr + " : " + extraAddr); 
					
				int rs = dao.insertBusiness(new MemberDTO(id, password, name, nickname, phone, email, postCode, detailAddr, roadAddr, extraAddr, null, business_no, 0, null));
				if(rs != -1) response.sendRedirect("/home");

				
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			
		}else if(cmd.equals("/loginProc.mem")){ // 로그인 요청
			String id = request.getParameter("id");
			String password = request.getParameter("password");
			System.out.println(id + " : " + password);
			boolean rs = dao.isLoginOk(id, password);
			System.out.println("rs : " + rs);
			
			if(rs) { //로그인 성공 시(rs값이 ture라면)
				MemberDTO dto = dao.selectById(id);
				String nickname = dto.getNickname();
				String member_category =  dto.getMember_category();
				HashMap<String,String> map = new HashMap<>();
				map.put("id",id);
				map.put("nickname", nickname);
				map.put("member_category",member_category);
				
				System.out.println("로그인 성공!");
				session.setAttribute("loginSession", map); 
				response.sendRedirect("/home");
				
				}else {
					System.out.println("로그인 실패!");
					RequestDispatcher rd = request.getRequestDispatcher("/member/login.jsp");
					request.setAttribute("rs", "fail");
					rd.forward(request, response);
				}
			}else if(cmd.equals("/logoutProc.mem")) { //로그아웃
				session.removeAttribute("loginSession");
				response.sendRedirect("/home");
			}else if(cmd.equals("/withdrawProc.mem")) { //회원탈퇴
				HashMap<String,String> map = (HashMap)session.getAttribute("loginSession");
				String id = map.get("id");
				System.out.println("탈퇴할 id : " + id);
				int rs = dao.deleteById(id);
				if(rs ==1) {
					session.invalidate();
					response.sendRedirect("/home");
				}
			}else if(cmd.equals("/toMyPage.mem")) { //마이페이지 이동
				HashMap<String,String> map = (HashMap)session.getAttribute("loginSession");
				String id = map.get("id");
				String member_category = map.get("member_category");
				MemberDTO dto = dao.selectById(id); //id값을 이용해서 DB에서 사용자의 정보 가져옴
				System.out.println("id : " + map.get("id"));
				System.out.println("member_category : " + map.get("member_category"));
				
				//해당 정보를 마이페이지에 뿌려주는작업								
				if(dto != null && member_category.equals("general")) { //일반회원 마이페이지
					
					MyPageService service = new MyPageService();
					int currentPage = Integer.parseInt(request.getParameter("currentPage"));
					HashMap<String,Object> naviMap = service.getPageNavi(currentPage, id);
					ArrayList<FreeBoardDTO> list = service.getFreeList(currentPage,id);
					request.setAttribute("list", list);
					request.setAttribute("naviMap", naviMap);
					request.setAttribute("dto", dto);
					
					RequestDispatcher rd = request.getRequestDispatcher("/member/generalMyPage.jsp");
					rd.forward(request, response);
					
				}else if(dto != null && member_category.equals("business")) { //사업자회원 마이페이지
					BusinessFileDAO filedao = new BusinessFileDAO();
					BusinessFileDTO filedto = new BusinessFileDTO();
					MyPageService service = new MyPageService();
					int currentPage = Integer.parseInt(request.getParameter("currentPage"));
					HashMap<String,Object> naviMap = service.getPageNavi(currentPage, id);
					ArrayList<FreeBoardDTO> list = service.getFreeList(currentPage,id);
					request.setAttribute("list", list);
					request.setAttribute("naviMap", naviMap);
					filedto = filedao.getBusinessFileNames(id);
					request.setAttribute("filedto", filedto);
					
					RequestDispatcher rd = request.getRequestDispatcher("/member/businessMyPage.jsp");
					request.setAttribute("dto", dto);
					rd.forward(request, response);
				}
			}else if(cmd.equals("/generalModifyInfoProc.mem")) { //일반회원 정보수정
					String nickname = request.getParameter("nickname");
					String phone = request.getParameter("phone");
					String email = request.getParameter("email");		
					int postCode = Integer.parseInt(request.getParameter("postCode"));
					String detailAddr = request.getParameter("detailAddr");
					String roadAddr = request.getParameter("roadAddr");
					String extraAddr = request.getParameter("extraAddr");
					HashMap<String,String> map = (HashMap)session.getAttribute("loginSession");
					String id = map.get("id");
					
					System.out.println(nickname + " : " + phone + " : " + email + " : " + postCode 
							+ " : " + detailAddr + " : " + roadAddr + " : " + extraAddr);
					
					int rs = dao.modifyById(new MemberDTO(id, null, null, nickname, phone, email, postCode, detailAddr, roadAddr, extraAddr, null, null, 0, null));
					if(rs != -1) response.sendRedirect("/toMyPage.mem?currentPage=1");
			}else if(cmd.equals("/businessModifyInfoProc.mem")) { //사업자회원 정보 수정
				String nickname = request.getParameter("nickname");
				String phone = request.getParameter("phone");
				String email = request.getParameter("email");		
				int postCode = Integer.parseInt(request.getParameter("postCode"));
				String detailAddr = request.getParameter("detailAddr");
				String roadAddr = request.getParameter("roadAddr");
				String extraAddr = request.getParameter("extraAddr");
				HashMap<String,String> map = (HashMap)session.getAttribute("loginSession");
				String id = map.get("id");
				
				System.out.println(nickname + " : " + phone + " : " + email + " : " + postCode 
						+ " : " + detailAddr + " : " + roadAddr + " : " + extraAddr);
								
				int rs = dao.modifyBusiness(new MemberDTO(id, null, null, nickname, phone, email, postCode, detailAddr, roadAddr, extraAddr, null, null, 0, null));
				if(rs != -1) response.sendRedirect("/toMyPage.mem?currentPage=1");
			}
		
		
		
		
		
		
		
		
		}	
}
	
