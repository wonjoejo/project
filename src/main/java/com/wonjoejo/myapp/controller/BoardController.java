package com.wonjoejo.myapp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.wonjoejo.myapp.domain.BoardDTO;
import com.wonjoejo.myapp.domain.BoardVO;
import com.wonjoejo.myapp.domain.Criteria;
import com.wonjoejo.myapp.service.BoardService;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;


@Log4j2
@NoArgsConstructor

@RequestMapping("/board")
@Controller
public class BoardController {

    @Setter(onMethod_={@Autowired})
    private BoardService service;

   // 게시판 목록화면 요청
    @GetMapping("/list")
    public void list(Model model){
    	
        log.debug("list() invoked.");

        List<BoardVO> list = this.service.getList();
        log.info("\t+ list size{}",list.size());

        model.addAttribute("list",list);
        
    }//list
    
    //특정 게시물 상세조회 화면 요청 
    @GetMapping("/detail")
    public void boarddetail(@ModelAttribute("cri") Criteria cri, Integer board_idx, Model model) {
    	log.debug("detail({},{},{}) invoked.",cri,board_idx,model);
    
    	BoardVO board = this.service.detail(board_idx);
		log.info("\t+ board: {}",board);
		
		model.addAttribute("board", board);
    }

    //게시물 삭제 
    @PostMapping("/delete")
    public String delete(@RequestParam("board_idx") Integer board_idx, 
			RedirectAttributes rttrs)  
	{
		log.debug("remove({}) invoked.",board_idx);
		
		boolean result = this.service.delete(board_idx);
		rttrs.addAttribute("result",result);
		
		return "redirect:/board/list";		
	}//delete
    
    //게시물 수정 
    @PostMapping("/edit")
	public String edit(BoardDTO board,RedirectAttributes rttrs) { 
		log.debug("edit({}) invoked.",board);
		
		//DTO -> VO 변환 
		BoardVO vo = 
			new BoardVO(
				board.getBoard_idx(),
				board.getMember_id(),
				board.getTitle(),
				board.getContent(),
				board.getNotice(),
				null,
				null,null,null
			);
		
		boolean result = this.service.edit(vo);
		
		rttrs.addAttribute("result",result);
		
		return "redirect:/board/list";
	}//edit
    
    @PostMapping("/write")
	public String write(BoardDTO board, RedirectAttributes rttrs) {
		log.debug("write({}) invoked.",board);
		
		BoardVO vo = new BoardVO(
				null,
				board.getMember_id(),
				board.getTitle(),
				board.getContent(),
				board.getNotice(),
				null,
				null,null,null
		);
		
		boolean result = this.service.write(vo);
		rttrs.addAttribute("result",result);	
		
		return "redirect:/board/list";
	}//register
    
    
    //====== 답글 ===============================================//
    
	//게시글 답글 작성 
	@PostMapping("/replywrite")
	public String replyWrite(BoardDTO board, RedirectAttributes rttrs) {
		log.debug("replyWrite({},{}) invoked.",board,rttrs);

		BoardVO vo = new BoardVO(
				null,
				board.getMember_id(),
				board.getTitle(),
				board.getContent(),
				null,
				null,
				board.getRef(),1,1
		);

		boolean result = this.service.writeReply(vo);
		rttrs.addAttribute("result",result);

		return "redirect:/board/list";
			
	}//replyWrite
	
	//게시글 답글 수정  
	@PostMapping("/replyedit")
	public void replyedit() {
		log.debug("replyedit() invoked.");
			
	}//replyedit
	
	//게시글 답글 삭제  
	@PostMapping("/replydelete")
	public void replydelete() {
		log.debug("replydelete() invoked.");
			
	}//replydelete
	
		
	

}//end class
