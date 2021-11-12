package com.wonjoejo.myapp.mapper;

import java.util.List;

import com.wonjoejo.myapp.domain.BoardVO;
import com.wonjoejo.myapp.domain.Criteria;

public interface BoardMapper {
	
	//게시판 목록조회  
	public abstract List<BoardVO> getList(); 
	
	//페이징 처리된 게시판 목록조회 
	public abstract List<BoardVO> getListWithPaging(Criteria cri);

	//새로운 게시물 등록
	public abstract	Integer insert(BoardVO board);

	//답변 등록 
	public abstract Integer insertReply(BoardVO board);
	
	//답변 수정  
	public abstract Integer updateReply(BoardVO board);
	
	//답변 삭제  
	public abstract Integer deleteReply(Integer board_idx);
	
	//새로운 게시글이 등록완료됨과 동시에 ,자동생성된 게시글(BNO)값을 얻어낼수가 있다.
	public abstract Integer insertSelectKey(BoardVO board);
	
	//특정 게시물 상세조회
	public abstract BoardVO read(Integer board_idx);
	
	//특정 게시물 업데이트 수행 
	public abstract Integer update(BoardVO board);
	
	//특정 게시물 삭제
	public abstract Integer delete(Integer board_idx);

	//총 게시물 개수를 반환 
	public abstract Integer getTotalCount();
	
	//게시판 공지사항 목록조회 페이징처리   
	public abstract List<BoardVO> getnoticePage(Criteria cri);

	//게시판 공지사항 목록조회 
	public abstract List<BoardVO> getnoticeList();

	//공지사항 게시물 개수를 반환 
	public abstract Integer getNoticeCount(); 
	
}//end interface
