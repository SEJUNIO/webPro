package com.lec.ex;

import java.io.IOException;
import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet(name = "Lifecyle", urlPatterns = { "/Lifecyle" })
public class Ex3Lifecycle extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@PostConstruct
	private void postConstructor() {
		//서블릿 객체가 생성될 때 실행
		System.out.println("Ex3LifeCycle 서블릿 생성될 때 수행 - 1");
	}
	public void init(ServletConfig config) throws ServletException {
		// 서블릿 객체가 생성될 때 실행
		System.out.println("Ex3LifeCycle 서블릿 생성될 때 수행 - 2");
	}
	public void destroy() {
		// 서블릿 객체가 소멸될 때 실행
		System.out.println("Ex3LifeCycle 서블릿 소멸되기 바로 전 수행");
	}
	@PreDestroy
	private void preDestroy() {
		System.out.println("Ex3LifeCycle 서블릿 소멸되기 바로 전 수행 - 2");
	}
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// service를 override하면 doGet()함수와 doPost()함수가 실행되지 않고 service()함수만 실행
		response.setContentType("text/html; charset=utf-8");
		response.getWriter().append("<h1>service() 실행</h1>");
		System.out.println("service() 실행");
				
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		response.getWriter().append("<h1>doGet() 실행</h1>");
		System.out.println("doGet() 실행");
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}
