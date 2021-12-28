package kh.com.semi.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kh.com.semi.dao.BusinessFileDAO;

@WebServlet("*.up")
public class BusinessFileController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}

	private void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		BusinessFileDAO dao = new BusinessFileDAO();
		String uri = request.getRequestURI();
		String ctxPath = request.getContextPath();
		String cmd = uri.substring(ctxPath.length());

		System.out.println("요청 url : " + cmd);
		

		if(cmd.equals("/toUpload.up")) {
			response.sendRedirect("/file/upload.jsp");
		}else if(cmd.equals("/uploadProc.up")) {
			System.out.println("요청 도착");
			
			//결과 : D:\KH\workspace_web\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\SemiProject\
			System.out.println(request.getServletContext().getRealPath(""));

			
			//BusinessFile 폴더 생성
			String  BusinessFilePath = request.getServletContext().getRealPath("BusinessFile"); 
			System.out.println("BusinessFilePath : "  + BusinessFilePath);
	
			//BusinessFile 폴더 미존재시 생성
			File dir = new File(BusinessFilePath);
			if(!dir.exists()) {
				dir.mkdir(); 
			}

		//파일크기 지정
		int fileSize = 1024*1024*10;
		
		//DefaultFileRenamePolicy
		try{//지금 요청들어온 값을 처리
			MultipartRequest multi = new MultipartRequest(request, BusinessFilePath, fileSize, "utf-8", new DefaultFileRenamePolicy());
			//businessSignup input name 넘긴상태
			String origin_name = multi.getOriginalFileName("BusinessFile1");
			//실제 서버 저장된 파일이름
			String system_name = multi.getFilesystemName("BusinessFile1");
			System.out.println(origin_name + " : " + system_name);
			
			//값을 가져올땐 무조건 multi.getParameter 사용필수
			String id = multi.getParameter("id");
			String nickname = multi.getParameter("nickname");
			System.out.println(id + " : " + nickname);

		}catch(Exception e) {
			e.printStackTrace();
		}
			
		}
		
	}
}

