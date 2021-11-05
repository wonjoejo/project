package com.wonjoejo.myapp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wonjoejo.myapp.domain.BoardVO;
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
    public void getBoardList(Model model){
    	
        log.debug("boardlist() invoked.");

        List<BoardVO> list = this.service.getList();
        log.info("\t+ list size{}",list.size());

        model.addAttribute("list",list);
        
    }//boardlist
//


}//end class
