package com.sist.dao.mapper;

import java.util.List;
import java.util.Map;

import com.sist.dao.*;
import com.sist.vo.AddressVO;
import com.sist.vo.BoardVO;
import com.sist.vo.MemberVO;

public interface MemberMapper {
	public int findPwd(MemberVO vo);
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
	public void pointMinus(Map map);

	//내문의사항
	public List<BoardVO> myQuestion(Map map);
	public int myQuestionTotal(Map map);
	public BoardVO myQ_content(int board_no);
	public void myQ_delete(int board_no);
	public BoardVO myQ_deleteData(int board_no);
	public void myQ_admin_delete(int board_no);
	public void myQ_update(BoardVO vo);
}
