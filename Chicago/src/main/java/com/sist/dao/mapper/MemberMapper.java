package com.sist.dao.mapper;

import java.util.List;
import java.util.Map;

import com.sist.dao.*;

public interface MemberMapper {
	public int idCheck(String id);
	public String pwdCheck(String pwd);
	public void joinMember(MemberVO vo);
	public int getGrade(String id);	
	public void memberDelete(String id);
	public void updateGrade(Map map);
	public List<MemberVO> memberlist(Map map);
	public int memberTotalPage(int rowSize);
	public List<MemberVO> memberSearch(Map map);
	public int memberSearchPage(Map map);
	
	/* Choding part */
	public MemberVO selectMember(String id);
	public void modyfyMemberInfo(MemberVO vo);
	public void modyfyMemberPwd(Map map);
	public AddressVO selectMemberDeliveryAddrs(String id);
	public void insertMemberDeliveryAddrs(AddressVO avo);
	public void modyfyMemberDeliveryAddrs(AddressVO avo);
	public void withdrawMember(Map map);
	
	//order
	public MemberVO orderData(String id);
		
}
