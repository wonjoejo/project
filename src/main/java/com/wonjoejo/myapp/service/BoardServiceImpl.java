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
//    @Override
//	public List<BoardVO> getList() {
//		log.debug(" getList({}) invoked.");
//		return this.mapper.getList();
//	}//getList

    
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

	
	//게시물 답글 작성 
	@Override
	public boolean writeReply(BoardVO board) {
		log.debug("writeReply({}) invoked.", board);

		int affectedRows = this.mapper.insertReply(board);
		log.info("\t+ affectedRows: {}", affectedRows);

		return affectedRows==1;
	}//writeReply

	
	//공지사항 리스트  
	@Override
	public List<BoardVO> getnoticeList(Criteria cri) {
		log.debug("getnoticeList({}) invoked.");
		return this.mapper.getnoticeList();
	}//getnoticeList

	//공지사항 페이징 
	@Override
	public List<BoardVO> getnoticePage(Criteria cri) {
		log.debug("getListPerPage({}) invoked.",cri);
		
		List<BoardVO> list = this.mapper.getnoticePage(cri);
		log.info("\t+ list size:{} ",list.size());
		
		return list;
	}//getnoticePage
	
	//공지사항 페이지 총 게시물 수 
	@Override
	public Integer getnoticeTotal() {
		log.debug("getTotal() invoked.");	
		return this.mapper.getNoticeCount();
	}//getnoticeTotal

	//공지사항 작성 
	@Override
	public boolean noticeWrite(BoardVO board) {
		log.debug("noticeWrite({}) invoked.", board);
		
		int affectedRows = this.mapper.insertNotice(board);
		log.info("\t+ affectedRows: {}", affectedRows);
		
		return affectedRows==1;
	}//noticeWrite
	
	//공지사항 상세보기 
	@Override
	public BoardVO noticedetail(Integer board_idx) {
		log.debug("noticedetail({}) invoked.", board_idx);
		
		BoardVO board = this.mapper.noticeread(board_idx);
		log.info("\t+ board: {}", board);
		
		return board;
	}//noticedetail
	
	
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
	
	//답글 목록 
	@Override
	public List<BoardVO> getreplyList(Criteria cri) {
		log.debug("getListPerPage({}) invoked.",cri);
		
		List<BoardVO> list = this.mapper.getnoticePage(cri);
		log.info("\t+ list size:{} ",list.size());
		
		return list;
	}//getreplyList
	
	//검색 페이지 
	@Override
	public List<BoardVO> getsearchPage(Criteria cri) {
		log.debug("getListPerPage({}) invoked.",cri);
		
		List<BoardVO> list = this.mapper.getsearchPage(cri);
		log.info("\t+ list size:{} ",list.size());
		
		return list;
	}//getsearchPage

	//검색 총 개수 
	@Override
	public Integer getsearchTotal(Criteria cri) {
		log.debug("getTotal() invoked.");	
		return this.mapper.getSearchCount(cri);
	}//getsearchTotal
	
	//본인 답글만 상세보기 
	@Override
	public List<BoardVO> replydetail(Integer board_idx,Integer ref, String member_id, Integer depth) {
		
		log.debug("ref({}) invoked.", ref);
		
		List<BoardVO> board = this.mapper.replyread(board_idx,ref,member_id, depth);
		log.info("\t+ board: {}", board);
		
		return board;
	}//replydetail

	//답글 본글 전체 삭제 
	@Override
	public boolean alldelete(Integer board_idx,Integer ref) {
		log.debug("deleteReplye({},{}) invoked.", board_idx,ref);
		
		int affectedRows = this.mapper.alldelete(board_idx,ref);
		log.info("\t+ affectedRows: {}", affectedRows);
		
		return affectedRows==1;	
	}//alldelete
	
	@Override
	public void destroy() throws Exception {
		log.debug("destroy({}) invoked.");
		
	}//destroy

	@Override
	public void afterPropertiesSet() throws Exception {
		log.debug("afterPropertiesSet({}) invoked.");
		
		assert this.mapper != null;
		log.info("\t+ mapper:" + this.mapper);
		
	}//afterPropertiesSet

}//end class 
