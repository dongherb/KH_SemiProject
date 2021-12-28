package kh.com.semi.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import kh.com.semi.dao.FreeBoardDAO;
import kh.com.semi.dto.FreeBoardDTO;

public class MyPageService {
	private FreeBoardDAO dao = new FreeBoardDAO();
	private int recordCntPerPage = 10;
	private int naviCntPerPage = 5;
	public HashMap<String,Object> getPageNavi(int currentPage, String id){
		
		
//		String id = "asdqwe123";
		int recordTotalCnt = dao.myCountAll(id);
		int pageTotalCnt = 0;
		if(recordTotalCnt % recordCntPerPage > 0) {
			pageTotalCnt = (recordTotalCnt / recordCntPerPage) + 1;
		}else {
			pageTotalCnt = recordTotalCnt / recordCntPerPage;
		}
		
		if(currentPage <1) {
			currentPage = 1;
		}else if(currentPage > pageTotalCnt) {
			currentPage = pageTotalCnt;
		}
		
		int startNavi = ((currentPage -1) / naviCntPerPage) * naviCntPerPage +1;
		int endNavi = startNavi + naviCntPerPage -1;
		
		if(endNavi > pageTotalCnt) {
			endNavi = pageTotalCnt;
		}
	
		boolean needPrev = true;
		boolean needNext = true;
		
		if(startNavi == 1) needPrev = false;
		if(endNavi == pageTotalCnt) needNext = false;
		
		System.out.println("recordTotalCnt: " + recordTotalCnt);
		System.out.println("pageTotalCnt : " + pageTotalCnt);
		System.out.println("startNavi : " + startNavi);
		System.out.println("endNavi : " + endNavi);
		System.out.println("needPrev : " + needPrev);
		System.out.println("needNext : " + needNext);
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("startNavi", startNavi);
		map.put("endNavi", endNavi);
		map.put("needPrev", needPrev);
		map.put("needNext", needNext);
		map.put("currentPage", currentPage);
		return map;	
	}
	
	public ArrayList<FreeBoardDTO> getFreeList(int currentPage, String id) {
		int startRange = currentPage * recordCntPerPage - (recordCntPerPage-1);
		int endRange = currentPage * recordCntPerPage;
		ArrayList<FreeBoardDTO> list = dao.selectMyBoard(id,startRange, endRange);
		System.out.println("테스트 : " + ":" + startRange + ":" + endRange);
		return list;
		
	}
	
}
