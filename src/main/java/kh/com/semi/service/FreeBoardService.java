package kh.com.semi.service;

import java.util.ArrayList;
import java.util.HashMap;

import kh.com.semi.dao.FreeBoardDAO;
import kh.com.semi.dto.FreeBoardDTO;

public class FreeBoardService {
	private FreeBoardDAO dao = new FreeBoardDAO();
	private int recordCntPerpage = 20;
	private int naviCntPerPage= 10;
	
	public HashMap<String, Object> getPageNavi(int currentPage){
		int recordTotalCnt = dao.countAll();
		int pageTotalCnt = 0;
		if(recordTotalCnt % recordCntPerpage > 0) {
			pageTotalCnt = (recordTotalCnt / recordCntPerpage) +1;
		}else {
			pageTotalCnt = recordTotalCnt / recordCntPerpage;
		}
		
		if(currentPage <1) {
			currentPage =1;
		}else if(currentPage > pageTotalCnt) {
			currentPage = pageTotalCnt;
		}
		
		int startNavi = ((currentPage-1)/naviCntPerPage) * naviCntPerPage +1;
		int endNavi = startNavi + naviCntPerPage -1;
		
		if(endNavi > pageTotalCnt) {
			endNavi = pageTotalCnt;
		}
		
		boolean needPrev = true;
		boolean needNext = true;
		if(startNavi == 1) needPrev = false;
		if(endNavi == pageTotalCnt) needNext = false;
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("startNavi", startNavi);
		map.put("endNavi", endNavi);
		map.put("needPrev", needPrev);
		map.put("needNext", needNext);
		map.put("currentPage", currentPage);
		return map;
	}
	
	public ArrayList<FreeBoardDTO> getBoardList(int currentPage){
		int startRange = currentPage * recordCntPerpage - (recordCntPerpage-1);
		int endRange = currentPage * recordCntPerpage;
		
		ArrayList<FreeBoardDTO> list = dao.getBoardList(startRange,endRange);
		//for(FreeBoardDTO dto : list) {
			// System.out.println(dto.getBoard_seq() + ":" + dto.getBoard_title() + ":" + dto.getWriter_nickname() + ":"
			//		+ dto.getWritten_date() + ":" + dto.getView_count() + ":" + dto.getRecommended_count());
		//}
		return list;
	}

}
