package com.sist.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.sist.dao.MemberVO;

public interface MemberService {
	public void MemberJoin(MemberVO vo) throws Exception;
	public boolean memberId(String id) throws Exception;
	public int memberGrade(String id) throws Exception;
	public boolean memberPwd(String id,String pwd) throws Exception;
	public void memberDelete(String id) throws Exception;
	public void updateGrade(Map map) throws Exception;
	public List<MemberVO> memberList(Map map) throws Exception;
	public int memberTotalPage(int rowSize) throws Exception;
	public List<MemberVO> memberSearch(Map map) throws Exception;
	public int memberSearchPage(Map map) throws Exception;
	
}
