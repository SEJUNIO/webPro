package com.lec.dao;

import java.util.ArrayList;
import com.lec.dto.DeptDto;

public class DeptTestMain {
	public static void main(String[] args) {
		DeptDao dao = DeptDao.getInstance();
		ArrayList<DeptDto> deptlist = dao.deptList();
		for(DeptDto dept : deptlist) {
			System.out.println(dept);
		}
		
	}
}
