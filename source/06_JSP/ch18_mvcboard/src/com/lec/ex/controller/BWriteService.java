package com.lec.ex.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.mvcboard.Service;
import com.lec.mvcboard.boardDao;
import com.lec.mvcboard.boardDto;
public class BWriteService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// bname, btitle, bcontent파라미터 받고, bip도 가져와서 dao통해서 write
		String bname    = request.getParameter("bname");
		String btitle   = request.getParameter("btitle");
		String bcontent = request.getParameter("bcontent");
		String bip      = request.getRemoteAddr();
		//boardDto dto = new boardDto(0, bname, btitle, bcontent, null, 0, 0, 0, 0, bip);
		boardDao bDao = new boardDao();
		//bDao.writeBoard(dto);
		request.setAttribute("writeResult", bDao.writeBoard(bname, btitle, bcontent, bip));
	}

}
