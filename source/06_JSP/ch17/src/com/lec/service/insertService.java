package com.lec.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class insertService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// insert 로직
		System.out.println("insert 로직 수행 함(파라미터받아서 dao함수 호출");
		request.setAttribute("insertResult", 1);

	}

}
