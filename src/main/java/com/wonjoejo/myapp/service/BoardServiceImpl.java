package com.wonjoejo.myapp.service;

import java.util.List;

import lombok.Setter;
import org.springframework.beans.factory.DisposableBean;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wonjoejo.myapp.domain.BoardVO;
import com.wonjoejo.myapp.domain.Criteria;
import com.wonjoejo.myapp.mapper.BoardMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;


@Log4j2
@AllArgsConstructor


@Service
public class BoardServiceImpl
	implements BoardService, InitializingBean, DisposableBean{

	
	@Setter(onMethod_= { @Autowired})
    private BoardMapper mapper;

	
    //게시물 목록 
    @Override
	public List<BoardVO> getList() {
		log.debug(" getList({}) invoked.");
		return this.mapper.getList();
	}//getList

    
    //게시물 상세보기 
	@Override
	public BoardVO detail(Integer board_idx) {
		log.debug("detail({}) invoked.", board_idx);
		
		BoardVO board = this.mapper.read(board_idx);
		log.info("\t+ board: {}", board);
		
		return board;
	}//detail
 
	
	//기존 게시물 삭제 
	@Override
	public boolean delete(Integer board_idx) {
		log.debug("delete({}) invoked.", board_idx);
		
		int affectedRows = this.mapper.delete(board_idx);
		log.info("\t+ affectedRows: {}", affectedRows);
		
		return affectedRows==1;
	}//delete

	
	//기존 게시물 수정 
	@Override
	public boolean edit(BoardVO board) {
		log.debug("edit({}) invoked.", board);
		
		int affectedRows = this.mapper.update(board);
		log.info("\t+ affectedRows: {}", affectedRows);
		
		return affectedRows==1;
	}//edit

	
	//새로운 게시물 작성 
	@Override
	public boolean write(BoardVO board) {
		log.debug("write({}) invoked.", board);
		
		int affectedRows = this.mapper.insertSelectKey(board);
		log.info("\t+ affectedRows: {}", affectedRows);
		
		return affectedRows==1;
	}//write

	
	//게시물 답글 작성 
	@Override
	public boolean writeReply(BoardVO board) {
		log.debug("writeReply({}) invoked.", board);

		int affectedRows = this.mapper.insertReply(board);
		log.info("\t+ affectedRows: {}", affectedRows);

		return affectedRows==1;
	}
	
	
	//답글 수정 
	@Override
	public boolean editReply(BoardVO board) {
		log.debug("editReply({}) invoked.", board);
		
		int affectedRows = this.mapper.updateReply(board);
		log.info("\t+ affectedRows: {}", affectedRows);
		
		return affectedRows==1;
	}//editReply

	
	//답글 삭제 
	@Override
	public boolean deleteReply(Integer board_idx) {
		log.debug("deleteReplye({}) invoked.", board_idx);
		
		int affectedRows = this.mapper.deleteReply(board_idx);
		log.info("\t+ affectedRows: {}", affectedRows);
		
		return affectedRows==1;
	}//deleteReply

	//게시물 페이지 
	@Override
	public List<BoardVO> getListPerPage(Criteria cri) {
		log.debug("getListPerPage({}) invoked.",cri);
		
		List<BoardVO> list = this.mapper.getListWithPaging(cri);
		log.info("\t+ list size:{} ",list.size());
		
		return list;
	}//getListPerPage
	
	
	//총 레코드 개수 반환 
	@Override
	public Integer getTotal() {
		log.debug("getTotal() invoked.");
		
		return this.mapper.getTotalCount();
	}//getTotal
	
	//공지사항 리스트  
	@Override
	public List<BoardVO> getnoticeList(Criteria cri) {
		log.debug("getnoticeList({}) invoked.");
		return this.mapper.getnoticeList();
	}

	//공지사항 페이지 
	@Override
	public List<BoardVO> getnoticePage(Criteria cri) {
		log.debug("getListPerPage({}) invoked.",cri);
		
		List<BoardVO> list = this.mapper.getnoticePage(cri);
		log.info("\t+ list size:{} ",list.size());
		
		return list;
	}
	
	
	@Override
	public void destroy() throws Exception {
		log.debug("destroy({}) invoked.");
		
	}//destroy

	@Override
	public void afterPropertiesSet() throws Exception {
		log.debug("afterPropertiesSet({}) invoked.");
		
		assert this.mapper != null;
		log.info("\t+ mapper:" + this.mapper);
	}


	@Override
	public Integer getnoticeTotal() {
		log.debug("getTotal() invoked.");	
		return this.mapper.getNoticeCount();
	}



}//end class 
