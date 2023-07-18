package balgil.com.trip.answer.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import balgil.com.trip.answer.model.AnswerVO;
import balgil.com.trip.answer.service.AnswerService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class AnswerRestController {
    
    @Autowired
    AnswerService service;
    
    @ResponseBody
    @RequestMapping(value = "/jsonSelectAllAnswer.do", method = RequestMethod.GET)
    public List<AnswerVO> jsonSelectAllAnswer(AnswerVO vo) {
        log.info("jsonSelectAllAnswer.do..");

        List<AnswerVO> vos = service.selectAll(vo);
        
        return vos;
    }
}