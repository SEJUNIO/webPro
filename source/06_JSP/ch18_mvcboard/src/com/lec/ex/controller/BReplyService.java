package com.lec.ex.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.mvcboard.Service;
import com.lec.mvcboard.boardDao;

public class BReplyService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String bname = request.getParameter("bname");
		String btitle = request.getParameter("btitle");
		String bcontent = request.getParameter("bcontent");
		String bip = request.getRemoteAddr();
		int bgroup = Integer.parseInt(request.getParameter("bgroup")); // 원글정보
		int bstep = Integer.parseInt(request.getParameter("bstep")); // 원글정보
		int bindent = Integer.parseInt(request.getParameter("bindent")); // 원글정보
		boardDao bDao = new boardDao();
		int replyResult = bDao.replyBoard(bname, btitle, bcontent, bip, bgroup, bstep, bindent);
		request.setAttribute("replyResult", replyResult);
	}

}
