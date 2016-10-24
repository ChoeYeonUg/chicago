package com.sist.dao.mapper;

import com.sist.dao.MemberVO;

public interface MemberMapper {
	public int idCheck(String id);
	public int pwdCheck(String pwd);
	public void joinMember(MemberVO vo);
}
