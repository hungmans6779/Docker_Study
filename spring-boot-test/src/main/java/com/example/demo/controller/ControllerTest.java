package com.example.demo.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = "/demo")
public class ControllerTest {

	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String Test() {
		return "test";
	}
}
