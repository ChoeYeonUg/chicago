package com.sist.dao.mapper;

import java.util.List;
import java.util.Map;

import com.sist.dao.MemberVO;

public interface MemberMapper {
	public int idCheck(String id);
	public String pwdCheck(String pwd);
	public void joinMember(MemberVO vo);
	public int getGrade(String id);	
	public void memberDelete(String id);
	public void updateGrade(Map map);
	public List<MemberVO> memberlist(Map map);
	public int memberTotalPage(int rowSize);
}
