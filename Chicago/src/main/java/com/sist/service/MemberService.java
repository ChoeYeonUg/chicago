package com.sist.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.sist.dao.AddressVO;
import com.sist.dao.BoardVO;
import com.sist.dao.MemberVO;

public interface MemberService {
	public boolean findPwd(MemberVO vo) throws Exception;
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
	public String pwdCheck(String id) throws Exception;
	public MemberVO selectMember(String id) throws Exception;
	public void modyfyMemberInfo(MemberVO vo) throws Exception;
	public void modyfyMemberPwd(Map map) throws Exception;
	public AddressVO selectMemberDeliveryAddrs(String id) throws Exception;
	public void insertMemberDeliveryAddrs(AddressVO avo) throws Exception;
	public void modyfyMemberDeliveryAddrs(AddressVO avo) throws Exception;
	public void withdrawMember(Map map) throws Exception;
	public void pointMinus(Map map) throws Exception;
	
	
	//order
	public MemberVO orderData(String id) throws Exception;
	
	public List<BoardVO> myQuestion(Map map) throws Exception;
	public int myQuestionTotal(Map map) throws Exception;
	public BoardVO secretboard_Content(int board_no) throws Exception;
	public void myQ_delete(int board_no) throws Exception;
	public void myQ_update(BoardVO vo) throws Exception;

}
