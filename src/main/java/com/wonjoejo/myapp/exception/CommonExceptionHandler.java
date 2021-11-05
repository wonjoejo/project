package com.wonjoejo.myapp.exception;

import org.springframework.http.HttpStatus;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;

import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;


@Log4j2
@NoArgsConstructor(access=lombok.AccessLevel.PUBLIC)

@ControllerAdvice
public class CommonExceptionHandler {

	@ResponseStatus(code=HttpStatus.BAD_REQUEST)	
	@ExceptionHandler(Exception.class)
	public String handleException(Exception e, Model model) {
		log.debug("handleException({}, {}) invoked.", e, model);
		
		// 예외처리를 수행...
		log.info("1. Exception Type: {}", e.getClass().getName());
		log.info("2. Exception Message: {}", e.getMessage());
		
		// 모델 상자에 예외객체를 담아서, 뷰로 전달하자!!!
		model.addAttribute("exception", e);
		
		return "errorPage";
	} // handleException

} // end class
