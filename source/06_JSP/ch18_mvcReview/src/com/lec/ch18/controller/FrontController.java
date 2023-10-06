package com.lec.ch18.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.ch18.service.MemberJoinService;
import com.lec.ch18.service.MemberListService;
import com.lec.ch18.service.Service;
@WebServlet("/FrontController")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private boolean joinMode = false;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		actionDo(request, response);
	}

	private void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String command = uri.substring(conPath.length());
		String viewPage = null;
		Service service = null;
		if(command.equals("/memberList.do")) {
			//list 로직 수행 호출
			service = new MemberListService();
			service.execute(request, response);
			viewPage = "member/memberList.jsp";
		}else if(command.equals("/memberJoinView.do")) {
			//회원가입 페이지로
			viewPage = "member/memberJoin.jsp";
			joinMode = true;
		}else if(command.equals("/memverJoin.do")) {
			if(joinMode) {
				service = new MemberJoinService();
				service.execute(request, response);
				joinMode = false;
			}
			viewPage = "memberList.do";
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}