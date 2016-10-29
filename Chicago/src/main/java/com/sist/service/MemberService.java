package com.sist.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.sist.dao.MemberVO;

public interface MemberService {
	public void MemberJoin(MemberVO vo) throws Exception;
	public boolean memberId(String id) throws Exception;
	public int memberGrade(String id) throws Exception;
	public boolean memberPwd(String id,String pwd) throws Exception;
}
