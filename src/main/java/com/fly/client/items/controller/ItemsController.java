package com.fly.client.items.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fly.client.items.service.ItemsService;

@Controller
@RequestMapping(value = "/mypage")
public class ItemsController {

	@Resource(name = "itemsService")
	private ItemsService itemsService;

	@Autowired
	HttpServletRequest request;
	
	@RequestMapping(value = "/itemActive.do", method = RequestMethod.GET, produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String itemActive(@RequestParam(value = "i_no") String I_no) {
		System.out.println("itemActive.do get방식에의한 메서드 호출 성공");
		String result = "2";
		System.out.println(I_no);
		result = itemsService.itemActive(I_no) + "";
		System.out.println(result);
		return result;
	}

	@RequestMapping(value = "/itemUnActive.do", method = RequestMethod.GET, produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String itemUnActive(@RequestParam(value = "i_no") String I_no) {
		System.out.println("itemUnActive.do get방식에의한 메서드 호출 성공");
		String result = "2";
		System.out.println(I_no);
		result = itemsService.itemUnActive(I_no) + "";
		System.out.println(result);
		return result;
	}

	@RequestMapping(value = "/itemDelete.do", method = RequestMethod.GET, produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String memberDelete(@RequestParam(value = "i_no") String I_no) {
		System.out.println("itemDelete.do get방식에의한 메서드 호출 성공");
		String result = "2";
		System.out.println(I_no);
		result = itemsService.itemDelete(I_no) + "";
		System.out.println(result);
		return result;
	}

}
