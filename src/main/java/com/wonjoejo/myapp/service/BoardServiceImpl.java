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
//@NoArgsConstructor
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

	@Override
	public boolean writeReply(BoardVO board) {
		log.debug("writeReply({}) invoked.", board);

		int affectedRows = this.mapper.insertReply(board);
		log.info("\t+ affectedRows: {}", affectedRows);

		return affectedRows==1;
	}

	@Override
	public List<BoardVO> getListPerPage(Criteria cri) {
		log.debug("getListPerPage({}) invoked.",cri);
		
		List<BoardVO> list = this.mapper.getListWithPaging(cri);
		log.info("\t+ list size:{} ",list.size());
		
		return list;
	}//getListPerPage
	
	@Override
	public Integer getTotal() {
		log.debug("getTotal() invoked.");
		
		return this.mapper.getTotalCount();
	}//getTotal
	
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
