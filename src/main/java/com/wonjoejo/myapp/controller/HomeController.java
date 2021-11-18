package com.wonjoejo.myapp.controller;

import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Locale;

@Log4j2
@NoArgsConstructor

@Controller
public class HomeController {

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String home(Locale locale, HttpServletRequest req) {
        log.info("Welcome home! The client locale is {}.", locale);

        HttpSession session = req.getSession();

        log.info("session: {}", session);

        String member_id = (String) session.getAttribute("member_id");

        log.info("member_id: {}", member_id);

//        Date date = new Date();
//        DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
//
//        String formattedDate = dateFormat.format(date);
//
//        model.addAttribute("serverTime", formattedDate);

        return "index";
    } // main

} // end class
