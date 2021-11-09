package com.wonjoejo.myapp.service;

import java.util.List;

import com.wonjoejo.myapp.domain.BoardVO;
import com.wonjoejo.myapp.domain.Criteria;

public interface BoardService {
	
	//전체 게시물의 목록조회 
    public abstract List<BoardVO> getList();
    
    public abstract List<BoardVO> getListPerPage(Criteria cri);

    //특정 게시물의 상세조회 
	public abstract BoardVO detail(Integer board_idx);

	//기존 게시글의 삭제
	public abstract boolean delete(Integer board_idx);

	//기존 게시글의 수정
	public abstract boolean edit(BoardVO board);

	//새로운 게시글의 등록
	public abstract boolean write(BoardVO board);

	public abstract boolean writeReply(BoardVO board);

	//총 레코드 개수 반환 
	public abstract Integer getTotal();
	
	


}//end interface
