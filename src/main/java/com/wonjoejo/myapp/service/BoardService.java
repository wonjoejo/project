package com.wonjoejo.myapp.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.wonjoejo.myapp.domain.BoardVO;
import com.wonjoejo.myapp.domain.Criteria;

public interface BoardService {
	
	//전체 게시물의 목록조회 
    //public abstract List<BoardVO> getList();
    
    //게시물 페이지 
    public abstract List<BoardVO> getListPerPage(Criteria cri);

    //특정 게시물의 상세조회 
	public abstract BoardVO detail(Integer board_idx);

	//기존 게시글의 삭제
	public abstract boolean delete(Integer board_idx);

	//기존 게시글의 수정
	public abstract boolean edit(BoardVO board);

	//새로운 게시글의 등록
	public abstract boolean write(BoardVO board);

	//총 레코드 개수 반환 
	public abstract Integer getTotal();
	
	//공지사항 총 레코드 개수 반환 
	public abstract Integer getnoticeTotal();

	//공지사항 목록조회 
    public abstract List<BoardVO> getnoticeList(Criteria cri);

    //공지사항 페이지 
	public abstract List<BoardVO> getnoticePage(Criteria cri);

	//공지사항 작성 
	public abstract boolean noticeWrite(BoardVO board);

	//공지사항 상세보기 
	public abstract BoardVO noticedetail(Integer board_idx);
	
	//답글 등록 
	public abstract boolean writeReply(BoardVO board);

	//답글 수정
	public abstract boolean editReply(BoardVO board);
	
	//답글 삭제 
	public abstract boolean deleteReply(Integer board_idx);

	//답글 목록
    public abstract List<BoardVO> getreplyList(Criteria cri);

	//본인 답글 상세보기 
    public abstract List<BoardVO> replydetail(Integer board_idx,@Param("ref") Integer ref, @Param("member_id")String member_id, @Param("depth") Integer depth);

	//답글 답글, 본글 삭제 
    public abstract boolean alldelete(Integer board_idx,Integer ref);
    
    //검색 목록 
    public abstract List<BoardVO> getsearchPage(Criteria cri);
    
    //검색 총 레코드 개수 반환 
    public abstract Integer getsearchTotal(Criteria cri);
	
}//end interface
