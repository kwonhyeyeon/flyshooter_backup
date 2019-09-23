package com.fly.admin.items.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fly.admin.items.service.AdminItemsService;

@Controller
@RequestMapping(value = "/admin/items")
public class AdminItemsController {

	@Resource(name = "adminItemsService")
	private AdminItemsService adminItemsService;
	
}
