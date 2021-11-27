package com.wonjoejo.myapp.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import com.wonjoejo.myapp.domain.PageDTO;
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

    // 페이징 처리된 QNA 게시판 목록
  	@GetMapping("/listPerPage")
  	public String listPerPage(
  			@ModelAttribute("cri") Criteria cri, 
  			Model model, HttpServletRequest req) {	
  		
  		HttpSession session = req.getSession();
     	
     	String member_id = (String)session.getAttribute("member_id");
     	
     	log.info("loginId========: {}", member_id);
  		
  		log.debug("listPerPage({}) invoked.",model);
  		
  		//비지니스 로직 처리 결과 데이터 --> Model 이라고 부른다.
  		List<BoardVO> list = this.service.getListPerPage(cri);
  		log.info("\t+ list size:{}",list.size());
  		
  		model.addAttribute("member_id",member_id);
  		model.addAttribute("list",list);
  		
  		List<BoardVO> noticeList = this.service.getnoticeList(cri);
  		log.info("\t+ list size:{}",list.size());
  		
  		model.addAttribute("noticeList",noticeList);
  		
  		
  		//--------------------------------------------//
  		//여기서부터 , 페이징 처리를 위한 모든 항목을 계산하도록 한다 
  		//--------------------------------------------//
  		Integer totalAmount = this.service.getTotal();
  		
  		
  		PageDTO pageDTO = new PageDTO(cri,totalAmount);
  		
  		model.addAttribute("pageMaker",pageDTO);
  		
  		//list.jsp 그대로 사용 
  		return "/board/list";
  	}//listPerPage
    
    //특정 게시물 상세조회 화면 요청 > admin일때 
    @GetMapping({"/detail","/edit"})
    public void boarddetail(@ModelAttribute("cri") Criteria cri, Integer board_idx, Model model, HttpServletRequest req) {
    	
    	HttpSession session = req.getSession();
    	
    	String member_id = (String)session.getAttribute("member_id");
    	
    	log.info("loginId========: {}", member_id);
    	
    	log.debug("detail({},{},{}) invoked.",cri,board_idx,model);
    
    	BoardVO board = this.service.detail(board_idx);
		log.info("\t+ board: {}",board);
		
		model.addAttribute("member_id",member_id);
		model.addAttribute("board", board);
    }//boarddetail
    
    //답글 상세조회 화면 요청 > 일반 회원 로그인 시
    @GetMapping("/replydetail")
    public String replydetail(@ModelAttribute("cri") Criteria cri, Integer board_idx ,@ModelAttribute("ref") String ref, @ModelAttribute("depth") String depth, Model model, HttpServletRequest req, RedirectAttributes rttrs) {
    	
    	HttpSession session = req.getSession();
    	
    	String member_id = (String)session.getAttribute("member_id");
    	
    	log.info("loginId========: {}", member_id);
    	
    	log.debug("detail({},{},{}) invoked.",cri,ref,model);
    
    	
    	List<BoardVO> list = this.service.replydetail(board_idx,Integer.parseInt(ref),member_id,Integer.parseInt(depth));
    	
    	String writerId = list.get(0).getMember_id(); // 질문글 쓴 ID
    	Integer depthNo = Integer.parseInt(depth);
    	
    	//xml 에서 order by 해준걸로 본인글 = 0 / 답글 = 1  
    	if(depthNo==0 && (writerId.equals(member_id) || member_id.equals("admin"))) {
    		model.addAttribute("member_id",member_id);
			model.addAttribute("board", list.get(0));
			
			return "/board/replydetail";
			
    	} else if (depthNo==1 && (writerId.equals(member_id) || member_id.equals("admin"))) {
    		model.addAttribute("member_id",member_id);
			model.addAttribute("board", list.get(1));
			
			return "/board/replydetail";
			
    	} else {
    		rttrs.addAttribute("member_id",member_id);

			//본인 작성글 & 답글 아니면 alert 띄우기 
			model.addAttribute("msg", "");
			model.addAttribute("url", "/board/listPerPage");
			
			return "/board/alert";	
    	}//if else
    	
    }//replydetail
    
    //게시물 삭제 
    @PostMapping("/delete")
    public String delete(@ModelAttribute("board_idx") Integer board_idx, 
			RedirectAttributes rttrs)  
	{
		log.debug("delete({}) invoked.",board_idx);
		
		boolean result = this.service.delete(board_idx);
		rttrs.addAttribute("result",result);
	
		return "redirect:/board/listPerPage";		
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
		
		return "redirect:/board/listPerPage";
	}//edit
    
    //게시글 작성 GET 
    @GetMapping("/write")
	public void register(@ModelAttribute("cri") Criteria cri, Model model, HttpServletRequest req) {
    	
    	HttpSession session = req.getSession();
    	
    	String member_id = (String)session.getAttribute("member_id");
    	
    	log.info("loginId========: {}", member_id);
    	
		log.debug("register() invoked.");
		
		log.info("\t+ cri:{}", cri);
		
		model.addAttribute("member_id",member_id);
		
	}//register
    
    //게시글 작성 POST
    @PostMapping("/write")
	public String write(BoardDTO board, RedirectAttributes rttrs) {
		log.debug("write({}) invoked.",board);
		
		BoardVO vo = new BoardVO(
				board.getBoard_idx(),
				board.getMember_id(),
				board.getTitle(),
				board.getContent(),
				board.getNotice(),
				null,
				board.getRef(),null,null
		);
		
		boolean result = this.service.write(vo);
		rttrs.addAttribute("result",result);	
		
		return "redirect:/board/listPerPage";
	}//write
    
    //-------공지사항 ------------------------------//
    
    //게시판 공지사항 목록화면 요청
    @GetMapping("/noticePage")
    public String noticePage(
    		@ModelAttribute("cri") Criteria cri, 
 			Model model, HttpServletRequest req) {	
    	
    	HttpSession session = req.getSession();
    	
    	String member_id = (String)session.getAttribute("member_id");
    	
    	log.info("loginId========: {}", member_id);
    	
 		log.debug("noticePage({}) invoked.",model);

 		List<BoardVO> noticeList = this.service.getnoticePage(cri);
 		log.info("\t+ noticeList size:{}",noticeList.size());
 		
 		model.addAttribute("member_id",member_id);
 		model.addAttribute("noticeList",noticeList);
 		
 		Integer totalAmount = this.service.getnoticeTotal();
 		
 		
 		PageDTO pageDTO = new PageDTO(cri,totalAmount);
 		
 		model.addAttribute("pageMaker",pageDTO);
 		
 		//list.jsp 그대로 사용 
 		return "/board/noticelist";
        
    }//noticelist
    
    //공지사항 작성 
    @GetMapping("/noticewrite")
	public void noticeWrite(@ModelAttribute("cri") Criteria cri, Model model, HttpServletRequest req) {
    	
    	HttpSession session = req.getSession();
    	
    	String member_id = (String)session.getAttribute("member_id");
    	
    	log.info("loginId========: {}", member_id);
    	
		log.debug("noticewrite() invoked.");
		
		log.info("\t+ cri:{}", cri);
		
		model.addAttribute("member_id",member_id);
		
	}//noticewrite
    
    //공지사항 작성 
    @PostMapping("/noticewrite")
	public String noticeWrite(BoardDTO board, RedirectAttributes rttrs) {
		log.debug("noticeWrite({}) invoked.",board);
		
		BoardVO vo = new BoardVO(
				null,
				board.getMember_id(),
				board.getTitle(),
				board.getContent(),
				1,
				null,
				board.getRef(),null,null
		);
		log.info("Board VO {}", vo);
		
		boolean result = this.service.noticeWrite(vo);
		rttrs.addAttribute("result",result);	
		
		return "redirect:/board/noticePage";
	}//noticeWrite
    
    //공지사항 상세조회 화면 요청 
    @GetMapping("/noticedetail")
    public void noticedetail(@ModelAttribute("cri") Criteria cri, Integer board_idx, Model model, HttpServletRequest req) {
    	log.debug("detail({},{},{}) invoked.",cri,board_idx,model);
    	
    	HttpSession session = req.getSession();
    	
    	String member_id = (String)session.getAttribute("member_id");
    	 
    	BoardVO board = this.service.noticedetail(board_idx);
		log.info("\t+ board: {}",board);
		
		model.addAttribute("board", board);
		model.addAttribute("member_id",member_id);
    }
    
    
    //-------- 답글 ----------------------------------------//
    @GetMapping("/replywrite")
	public void replyregister(@ModelAttribute("cri") Criteria cri, Model model, HttpServletRequest req) {
    	HttpSession session = req.getSession();
    	
    	String member_id = (String)session.getAttribute("member_id");
    	
    	log.info("loginId========: {}", member_id);
    	
    	log.debug("replyregister() invoked.");
		
		log.info("\t+ cri:{}", cri);
		
		model.addAttribute("member_id",member_id);
		
	}//replywrite
    
	//게시글 답글 작성 
	@PostMapping("/replywrite")
	public String replyWrite(BoardDTO board, RedirectAttributes rttrs) {
		log.debug("replyWrite({},{}) invoked.",board,rttrs);

		BoardVO vo = new BoardVO(
				board.getBoard_idx(),
				board.getMember_id(),
				board.getTitle(),
				board.getContent(),
				board.getNotice(),
				null,
				board.getRef(),1,1
		);

		boolean result = this.service.writeReply(vo);
		rttrs.addAttribute("result",result);

		return "redirect:/board/listPerPage";
			
	}//replyWrite
	
	//게시글 답글 수정  
	@PostMapping("/replyedit")
	public String replyedit(BoardDTO board,RedirectAttributes rttrs) {
		log.debug("replyedit({},{}) invoked.",board,rttrs);
		
		//DTO -> VO 변환 
		BoardVO vo = 
			new BoardVO(
				board.getBoard_idx(),
				board.getMember_id(),
				board.getTitle(),
				board.getContent(),
				board.getNotice(),
				null,
				board.getRef(),1,1
			);
		
		boolean result = this.service.editReply(vo);
		
		rttrs.addAttribute("result",result);
		
		return "redirect:/board/listPerPage";
	}//replyedit
	
	//게시글 답글 삭제  
	@PostMapping("/replydelete")
	 public String replydelete(@RequestParam("board_idx") Integer board_idx, 
				RedirectAttributes rttrs)  
		{
			log.debug("remove({}) invoked.",board_idx);
			
			boolean result = this.service.delete(board_idx);
			rttrs.addAttribute("result",result);
			
			return "redirect:/board/listPerPage";		
	}//replydelete
	
	//답글 목록   
	@GetMapping("/replylist")
 	public String replylist(@ModelAttribute("cri") Criteria cri, Model model) {	
 		
		log.debug("replylist({}) invoked.",model);
 		
 		//비지니스 로직 처리 결과 데이터 --> Model 이라고 부른다.
 		List<BoardVO> list = this.service.getListPerPage(cri);
 		log.info("\t+ list size:{}",list.size());
 		
 		model.addAttribute("list",list);
 		
 		List<BoardVO> replylist = this.service.getnoticeList(cri);
 		log.info("\t+ list size:{}",list.size());
 		
 		model.addAttribute("replylist",replylist);
 		
 		
 		//--------------------------------------------//
 		//여기서부터 , 페이징 처리를 위한 모든 항목을 계산하도록 한다 
 		//--------------------------------------------//
 		Integer totalAmount = this.service.getTotal();
 		
 		
 		PageDTO pageDTO = new PageDTO(cri,totalAmount);
 		
 		model.addAttribute("pageMaker",pageDTO);
 		
 		//list.jsp 그대로 사용 
 		return "/board/list";
 	}//replylist

	
	// 검색 목록화면 요청 
	@GetMapping("/searchlist")
	public String searchList(@ModelAttribute("cri") Criteria cri,Model model) {
		
		log.debug("searchList({}) invoked.", model);
		
		String keyword = cri.getKeyword();
		log.info("\t + keyword: {}", keyword);

		cri.setKeyword(keyword.replace(" ", ""));
		log.info("\t + cri.keyword: {}", cri.getKeyword());

		List<BoardVO> searchList = this.service.getsearchPage(cri);
		log.info("\t+ list size:{}", searchList.size());

		model.addAttribute("searchList", searchList);

		//--------------------------------------------//
		//여기서부터 , 페이징 처리를 위한 모든 항목을 계산하도록 한다
		//--------------------------------------------//
		Integer totalAmount = this.service.getsearchTotal(cri);

		PageDTO pageDTO = new PageDTO(cri, totalAmount);

		model.addAttribute("pageMaker", pageDTO);

			//list.jsp 그대로 사용
			return "/board/searchlist";
		}//searchList
		
	//게시물 본글 답글 전체 삭제 
    @PostMapping("/alldelete")
    public String alldelete(@RequestParam("board_idx") Integer board_idx,@ModelAttribute("ref") Integer ref, 
		RedirectAttributes rttrs)  
	{
		log.debug("delete({},{}) invoked.",board_idx,ref);
		
		boolean result = this.service.alldelete(board_idx,ref);
		rttrs.addAttribute("result",result);
		
		return "redirect:/board/listPerPage";		
	}//delete

}//end class
