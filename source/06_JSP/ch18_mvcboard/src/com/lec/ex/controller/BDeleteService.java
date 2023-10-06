package com.lec.ex.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.mvcboard.Service;
import com.lec.mvcboard.boardDao;

public class BDeleteService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int bid = Integer.parseInt(request.getParameter("bid"));
		boardDao bDao = new boardDao();
		int result = bDao.deleteBoard(bid);
		String deleteMsg = (result==boardDao.SUCCESS) ? bid+"번글 삭제 성공" : bid+"번글 삭제 실패";

	}

}
