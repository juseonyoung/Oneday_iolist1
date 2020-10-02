package com.biz.iolist.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.biz.iolist.model.IoVO;
import com.biz.iolist.service.IoService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping(value = "/") //url 경로최초지정, 최초하면
public class IoController {

	@Autowired
	private IoService ioservice; // Impl
	
	@RequestMapping(value = { "/", "" }, method = RequestMethod.GET) // 리스트 보여주는화면
	public String list(Model model) {

		List<IoVO> iolist =ioservice.selectAll(); //컴퓨터에 접근하는 service클래스 이용해 selectall
		// 또!! 리스트에 담아줌
		
		model.addAttribute("IOLIST",iolist); //iolist 는 내가 보내려는 값, 앞에 문자열을 붙여서 같이 보낸다 view단에서 이름표 같이 입력
		model.addAttribute("BODY","IO-HOME"); //위에 보낼 리스트를 위치시킬 place를 지정
		return "home";
	}

	
	@RequestMapping(value = "/input", method = RequestMethod.GET)
	public String input(@ModelAttribute("iovo") IoVO iovo,Model model) {
	
		model.addAttribute("BODY","IO-INPUT");
		
		return "home";

	}

	
	@RequestMapping(value = "/input", method = RequestMethod.POST)
	public String input(@ModelAttribute("iovo") IoVO ioVO) {

		LocalDateTime local = LocalDateTime.now();
		String date = DateTimeFormatter.ofPattern("yyyy-MM-dd").format(local);
		String time = DateTimeFormatter.ofPattern("HH:mm:ss").format(local);
		
		ioVO.setIo_date(date);
		ioVO.setIo_time(time);
		ioservice.insert(ioVO);
		
		return "redirect:/";
	}

	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String detail(@PathVariable("seq") String seq, Model model) { //디테일이 있는 곳
		
//		List<I>
//		model.addAttribute(seq);
		return "home";
	}

	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String update(@RequestParam("id") @ModelAttribute("IoVO") String id, IoVO ioVO, Model model) {

		return "";
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(@ModelAttribute IoVO ioVO, Model model) {

		return "redirect:/";
	}

	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete(@RequestParam("seq") String seq) {

		return "redirect:/";

	}

}