package kh.com.semi.dto;

import java.sql.Date;
import java.text.SimpleDateFormat;

public class FreeBoardDTO {
	public FreeBoardDTO() {
	}

	private int board_seq;
	private String writer_nickname;
	private String board_title;
	private String board_content;
	private Date written_date;
	private int view_count;
	private int recommended_count;
	private String board_category = "자유";
	private String id;

	public FreeBoardDTO(int board_seq, String writer_nickname, String board_title, String board_content, Date written_date,
			int view_count, int recommended_count, String board_category, String id) {
		super();
		this.board_seq = board_seq;
		this.writer_nickname = writer_nickname;
		this.board_title = board_title;
		this.board_content = board_content;
		this.written_date = written_date;
		this.view_count = view_count;
		this.recommended_count = recommended_count;
		this.board_category = board_category;
		this.id = id;
	}

	public int getBoard_seq() {
		return board_seq;
	}

	public void setBoard_seq(int board_seq) {
		this.board_seq = board_seq;
	}

	public String getWriter_nickname() {
		return writer_nickname;
	}

	public void setWriter_nickname(String writer_nickname) {
		this.writer_nickname = writer_nickname;
	}

	public String getBoard_title() {
		return board_title;
	}

	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}

	public String getBoard_content() {
		return board_content;
	}

	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}

	public Date getWritten_date() {
		return written_date;
	}

	public void setWritten_date(Date written_date) {
		this.written_date = written_date;
	}

	public int getView_count() {
		return view_count;
	}

	public void setView_count(int view_count) {
		this.view_count = view_count;
	}

	public int getRecommended_count() {
		return recommended_count;
	}

	public void setRecommended_count(int recommended_count) {
		this.recommended_count = recommended_count;
	}

	public String getBoard_category() {
		return board_category;
	}

	public void setBoard_category(String board_category) {
		this.board_category = board_category;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

}
