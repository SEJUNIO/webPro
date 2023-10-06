package com.lec.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class selectService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// select로직
		System.out.println("select로직 수행함(pageNum받아 startRow, endRow계산후 dao에서 list받아옴");
		request.setAttribute("list", "list결과를 ArrayList로 받은 것");
	}

}
