package com.lec.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DeleteService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// Delete로직
		System.out.println("delete로직(파라미터 받아 dao를 통해 delete하기");
		request.setAttribute("deleteResult", "삭제성공");
	}

}
