package com.lec.ex.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.mvcboard.Service;
import com.lec.mvcboard.boardDao;

public class BModifyViewService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// bid파라미터 받아 dao를 통해 dto request에 set
		int bid = Integer.parseInt(request.getParameter("bid"));
		boardDao bDao = new boardDao();
		request.setAttribute("modifyBoard", bDao.getBoardNotHitUp(bid));

	}

}
