package com.lec.ex.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.mvcboard.Service;
import com.lec.mvcboard.boardDao;

public class BReplyViewService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int bid = Integer.parseInt(request.getParameter("bid")); // 원글의 글번호
		boardDao bDao = new boardDao();
		request.setAttribute("replyBoard", bDao.getBoardNotHitUp(bid)); // 원글의 dto정보

	}

}
