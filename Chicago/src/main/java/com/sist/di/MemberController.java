package com.sist.di;

import java.text.SimpleDateFormat;
import java.util.*;

import com.sist.dao.*;
import com.sist.service.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

/* Made By Choding */
@Controller
public class MemberController {
	
	/* private */
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	@Resource(name="memberService")
	private MemberService ms;
	
	
	/* HeadMenu */
	@RequestMapping("mypage.do")
	public String member_page(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		model.addAttribute("jsp", "member.jsp");
		model.addAttribute("member_jsp", "../member/MemberMain.jsp");
		
		model.addAttribute("MemberMain_cmi", "../MemberMain.jsp");
		model.addAttribute("cmi", "../member/MemberMainHome.jsp");
		
		return "main/main";
		
	}
	
	
	@RequestMapping(value="membersecurepwd_ok.do", method=RequestMethod.POST)
	public String membersecurepwd_ok(Model model, HttpServletRequest request, String USER_Check_PWD, String typecheck,
			RedirectAttributes redirectAttributes) throws Exception {
		
		HttpSession hs = request.getSession();
		String sessionid = (String)hs.getAttribute("id");
		String cpwd = ms.pwdCheck(sessionid);
		String url="";
		
		model.addAttribute("jsp", "member.jsp");
		model.addAttribute("member_jsp", "../member/MemberMain.jsp");
		
		model.addAttribute("MemberMain_cmi", "../MemberMain.jsp");
		
			if(USER_Check_PWD.equals(cpwd)) {
				
				if(typecheck.equals("mi")) {
					
					redirectAttributes.addFlashAttribute("check", "ok");
					url= "redirect:modifyMemberInfo.do";
					
				} else if(typecheck.equals("ma")) {
					
					redirectAttributes.addFlashAttribute("check", "ok");
					url= "redirect:memberAddrsInfo.do";
					
				}
			
			} else {
								
				model.addAttribute("typecheck", typecheck);
				//url = "redirect:modifyMemberInfo.do";
				
				if(typecheck.equals("mi")) {
					 					
					url = "redirect:modifyMemberInfo.do";
					} else {
						url= "redirect:memberAddrsInfo.do";
					}
			}
			return url;
	}
	
	
	/* Member Info HeadMenu */
	@RequestMapping("memberinfo.do")
	public String member_info_page(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		model.addAttribute("jsp", "member.jsp");
		model.addAttribute("member_jsp", "../member/MemberMain.jsp");
		
		model.addAttribute("MemberMain_cmi", "../MemberMain.jsp");
		model.addAttribute("cmi", "../member/MemberMainHome.jsp");
		
		return "main/main";
		
	}
	
	
	/* Member Info SideMenu Include */
	@RequestMapping("modifyMemberInfo.do")
	public String member_side_info_page(Model model, HttpServletRequest request, HttpServletResponse response, String typecheck) throws Exception {
		
		model.addAttribute("jsp", "member.jsp");
		model.addAttribute("member_jsp", "../member/MemberMain.jsp");
		
		try{
			
			Map<String, ?> flashMap = RequestContextUtils.getInputFlashMap(request);
			String check = (String) flashMap.get("check");
			model.addAttribute("cmi", "../member/memberinfomodify/ModifyMemderInfo.jsp");
			HttpSession hs = request.getSession();
			String sessionid = (String)hs.getAttribute("id");
			MemberVO vo = ms.selectMember(sessionid);
			model.addAttribute("vo", vo);
			
		}catch(Exception ex){
			
			typecheck = "mi";
			
			model.addAttribute("typecheck", typecheck);
			model.addAttribute("cmi", "../member/MemberSecurePassword.jsp");
			
		}
		
		return "main/main";
		
	}
	
	
	@RequestMapping(value="modyfyMemberInfo_ok.do", method=RequestMethod.POST)
	public String modyfyMemberInfo_ok(Model model, MemberVO vo, HttpServletRequest request, HttpServletResponse response, int zipcode, String addr, String email, String phone, String name, int gender) throws Exception {
		
		logger.info(vo.getId() + " : " + vo.getPwd());
		
		HttpSession hs = request.getSession();
		String sessionid = (String) hs.getAttribute("id");
		
		model.addAttribute("jsp", "member.jsp");
		model.addAttribute("member_jsp", "../member/MemberMain.jsp");
		
		model.addAttribute("MemberMain_cmi", "MemberMain.jsp");
		
		if(ms.memberId(sessionid) && !sessionid.equals("admin")) {
				
				vo = new MemberVO();
				vo.setName(name);
				vo.setGender(gender);
				vo.setZipcode(zipcode);
				vo.setAddr(addr);
				vo.setEmail(email);
				vo.setPhone(phone);
				vo.setId(sessionid);
				ms.modyfyMemberInfo(vo);
				
				return "redirect:main.do";
				
		} else {
			
			model.addAttribute("MemberMain_cmi", "MemberMain.jsp");
			model.addAttribute("cmi", "../member/memberinfomodify/ModifyMemderInfo.jsp");
			
		}
		
		return "redirect:main.do";
		
	}
	
	
	@RequestMapping("modyfyMemberPwd.do")
	public String member_side_pwd_page(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		model.addAttribute("jsp", "member.jsp");
		model.addAttribute("member_jsp", "../member/MemberMain.jsp");
		
		model.addAttribute("MemberMain_cmi", "MemberMain.jsp");
		model.addAttribute("cmi", "../member/memberinfomodify/ModifyMemberPassword.jsp");
		
		return "main/main";
		
	}
	
	
	@RequestMapping(value="modyfyMemberPwd_ok.do", method=RequestMethod.POST)
	public String modyfyMemberPwd_ok(Model model, MemberVO vo, HttpServletRequest request, HttpServletResponse response,String USER_NewPWD, String USER_C_NewPWD) throws Exception {
		
		logger.info(vo.getId() + " : " + vo.getPwd());
		
		HttpSession hs = request.getSession();
		String sessionid = (String) hs.getAttribute("id");
		
		model.addAttribute("jsp", "member.jsp");
		model.addAttribute("member_jsp", "../member/MemberMain.jsp");
		
		if(ms.memberId(sessionid) && ms.memberPwd(sessionid,vo.getPwd()) && !sessionid.equals("admin")) {
			if(USER_NewPWD.equals(USER_C_NewPWD)) {
				
				Map map = new HashMap();
				map.put("pwd", USER_NewPWD);
				map.put("id", sessionid);
				ms.modyfyMemberPwd(map);
				
				return "redirect:main.do";
				
			} else {
				
				model.addAttribute("MemberMain_cmi", "MemberMain.jsp");
				model.addAttribute("cmi", "../member/memberinfomodify/ModifyMemberPassword.jsp");
				
			}
			
		} else {
			
			model.addAttribute("MemberMain_cmi", "MemberMain.jsp");
			model.addAttribute("cmi", "../member/memberinfomodify/ModifyMemberPassword.jsp");
			
		}
		
		return "redirect:main.do";
		
	}
	
	
	@RequestMapping("memberPoint.do")
	public String member_side_point_page(Model model, MemberVO vo, HttpServletRequest request, HttpServletResponse response, String gradename) throws Exception {
		
		HttpSession hs = request.getSession();
		String sessionid = (String) hs.getAttribute("id");
		
		vo = ms.selectMember(sessionid);
		
		if(vo.getGrade()==1 || vo.getGrade()==0) {
			gradename = "운영자";
		} else if(vo.getGrade()==2) {
			gradename = "다이아몬드";
		} else if(vo.getGrade()==3) {
			gradename = "플레티넘";
		} else if(vo.getGrade()==4) {
			gradename = "골드";
		} else if(vo.getGrade()==5) {
			gradename = "일반";
		}
		
		model.addAttribute("gradename", gradename);
		model.addAttribute("vo", vo);
		
		model.addAttribute("jsp", "member.jsp");
		model.addAttribute("member_jsp", "../member/MemberMain.jsp");
		
		model.addAttribute("MemberMain_cmi", "MemberMain.jsp");
		model.addAttribute("cmi", "../member/memberinfomodify/MemberPoint.jsp");
		
		return "main/main";
		
	}
	
	@RequestMapping("memberAddrsInfo.do")
	public String memberAddrsInfo_page(Model model, HttpServletRequest request, HttpServletResponse response, String typecheck) throws Exception {
		
		
		model.addAttribute("jsp", "member.jsp");
		model.addAttribute("member_jsp", "../member/MemberMain.jsp");
		
		try{
			Map<String, ?> flashMap = RequestContextUtils.getInputFlashMap(request);
			String check = (String) flashMap.get("check");
			model.addAttribute("cmi", "../member/memberinfomodify/ModifyMemberAddress.jsp");
			HttpSession hs = request.getSession();
			String sessionid = (String)hs.getAttribute("id");
			AddressVO avo = ms.selectMemberDeliveryAddrs(sessionid);
			model.addAttribute("avo", avo);			
		}catch(Exception ex){
			
			typecheck = "ma";
			
			model.addAttribute("typecheck", typecheck);
			model.addAttribute("cmi", "../member/MemberSecurePassword.jsp");
			
		}
		
		return "main/main";
		
	}
	
	@RequestMapping(value="modyfyMemberAddrs_ok.do", method=RequestMethod.POST)
	public String modyfyMemberAddrs_ok(Model model, AddressVO avo, HttpServletRequest request, HttpServletResponse response, String id, int zipcode1, String addr1, int zipcode2, String addr2,int zipcode3, String addr3) throws Exception {
		
		logger.info(avo.getId());
		
		HttpSession hs = request.getSession();
		String sessionid = (String) hs.getAttribute("id");
		
		model.addAttribute("jsp", "member.jsp");
		model.addAttribute("member_jsp", "../member/MemberMain.jsp");
		
		
		
		if(ms.memberId(sessionid) && !sessionid.equals("admin")) {
			if(id==null) {

				avo = new AddressVO();
				avo.setZipcode1(zipcode1);
				avo.setAddr1(addr1);
				avo.setZipcode2(zipcode2);
				avo.setAddr2(addr2);
				avo.setZipcode3(zipcode3);
				avo.setAddr3(addr3);
				avo.setId(sessionid);
				ms.insertMemberDeliveryAddrs(avo);
			
			} else {
				
				avo = new AddressVO();
				avo.setZipcode1(zipcode1);
				avo.setAddr1(addr1);
				avo.setZipcode2(zipcode2);
				avo.setAddr2(addr2);
				avo.setZipcode3(zipcode3);
				avo.setAddr3(addr3);
				avo.setId(sessionid);
				ms.modyfyMemberDeliveryAddrs(avo);
				
			}
			
			return "redirect:main.do";
			
		} else {
			
			model.addAttribute("MemberMain_cmi", "MemberMain.jsp");
			model.addAttribute("cmi", "../member/MemberMainHome.jsp");
			
		}
		
		return "redirect:main.do";
		
	}
	
	@RequestMapping("withdrawMember.do")
	public String member_side_withdraw_page(Model model, HttpServletRequest request, HttpServletResponse response) {
		
		model.addAttribute("jsp", "member.jsp");
		model.addAttribute("member_jsp", "../member/MemberMain.jsp");
		
		model.addAttribute("MemberMain_cmi", "MemberMain.jsp");
		model.addAttribute("cmi", "../member/memberinfomodify/WithdrawMember.jsp");
		
		return "main/main";
		
	}
	
	@RequestMapping(value="withdrawMember_ok.do", method=RequestMethod.POST)
	public String withdrawMember_ok(Model model, MemberVO vo, HttpServletRequest request,String USER_PWD, String USER_C_PWD, HttpServletResponse response) throws Exception {
		
		logger.info(vo.getId() + " : " + vo.getPwd());
		
		HttpSession hs = request.getSession();
		String sessionid = (String) hs.getAttribute("id");
		
		model.addAttribute("jsp", "member.jsp");
		model.addAttribute("member_jsp", "../member/MemberMain.jsp");
		
		if(ms.memberPwd(sessionid, USER_PWD) && !sessionid.equals("admin")) {
			
			Map map = new HashMap();
			map.put("id", sessionid);
			map.put("pwd", USER_PWD);
			ms.withdrawMember(map);
			
			hs.invalidate();
			
		} else {
			
			model.addAttribute("MemberMain_cmi", "MemberMain.jsp");
			model.addAttribute("cmi", "../member/memberinfomodify/WithdrawMember.jsp");
			
		}
		
		return "redirect:main.do";
		
	}
	
	/* Member Question HeadMenu */ 
	@RequestMapping("myMemberquestion.do")
	public String myMemberquestion(Model model,String page, HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession hs = request.getSession();		
		String id = (String) hs.getAttribute("id");
		
		if(page==null)
			page="1";
		
		int curpage = Integer.parseInt(page);
		int rowSize = 10;
		int start = (curpage * rowSize) - (rowSize - 1);
		int end = curpage * rowSize;
		int block=5;
		int fromPage = ((curpage-1)/block*block)+1;
		int toPage = ((curpage-1)/block*block)+block;
		String msg="관리자가 삭제한 게시물입니다.";
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
	    String today=sdf.format(new Date());
		
	    Map map = new HashMap();
	    map.put("start", start);
		map.put("end", end);
		map.put("id", id);
		map.put("rowSize", rowSize);
	
		List<BoardVO> list;
		int totalpage;
		try{
		list=ms.myQuestion(map);
		totalpage=ms.myQuestionTotal(map);
		
		if(toPage> totalpage) 
			toPage = totalpage;	
		if(totalpage==0)
			totalpage=1;
		
		
		
		model.addAttribute("block",block);
		model.addAttribute("fromPage", fromPage);
		model.addAttribute("toPage", toPage);
		model.addAttribute("totalpage", totalpage);
		model.addAttribute("curpage", curpage);
		model.addAttribute("list", list);
		model.addAttribute("today",today);
		model.addAttribute("msg",msg);
		model.addAttribute("pCheck",2);
		model.addAttribute("MemberMain_cmi", "MemberMain.jsp");
		model.addAttribute("cmi","../member/memberquestion/MyMemberQuestion.jsp" );
		
		model.addAttribute("jsp", "member.jsp");
		model.addAttribute("member_jsp", "../member/MemberMain.jsp");		
		
		}catch(Exception e){
			System.out.println(e.getMessage());
			e.getStackTrace();
		}
		
		return "main/main";
		
	}
	
	
	@RequestMapping("myQcontent.do")
	public String myQcontent(Model model,String page,int board_no, HttpServletRequest request, HttpServletResponse response) {
		if(page==null)
			page="1";		
		int curpage = Integer.parseInt(page);
		
		try{				
			BoardVO vo=ms.secretboard_Content(board_no);		
	
			model.addAttribute("page",curpage);
			model.addAttribute("vo",vo);
			model.addAttribute("board_no",board_no);
			model.addAttribute("jsp", "board.jsp");
						
			model.addAttribute("MemberMain_cmi", "MemberMain.jsp");
			model.addAttribute("cmi","../member/memberquestion/myQcontent.jsp" );
			
			model.addAttribute("jsp", "member.jsp");
			model.addAttribute("member_jsp", "../member/MemberMain.jsp");	
		}catch (Exception e) {
			e.getStackTrace();
			System.out.println(e.getMessage());
		}			
		
			
		return "main/main";
	}
	
	@RequestMapping("myQ_delete")
	public String myQ_delete(Model model,int board_no, String page, HttpServletRequest request, HttpServletResponse response){
		if(page==null)
			page="1";		
		int curpage = Integer.parseInt(page);

		try{
			ms.myQ_delete(board_no);
			model.addAttribute("page",curpage);
			System.out.println("zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz"+board_no);
		}catch(Exception e){
			System.out.println(e.getMessage());
			e.getStackTrace();
		}

		return "redirect:myMemberquestion.do";
	
	}
	
	@RequestMapping("myQ_update")
	public String myQ_update(Model model,int board_no,HttpServletRequest request, HttpServletResponse response){
		
		try{
			BoardVO vo=ms.secretboard_Content(board_no);
		
			model.addAttribute("vo",vo);		
			
			model.addAttribute("MemberMain_cmi", "MemberMain.jsp");
			model.addAttribute("cmi","../member/memberquestion/myQ_update.jsp" );
			
			model.addAttribute("jsp", "member.jsp");
			model.addAttribute("member_jsp", "../member/MemberMain.jsp");
		
		}catch(Exception e){
			e.getStackTrace();
			System.out.println(e.getMessage());
		}		
		return "main/main";
	}
	
	@RequestMapping("myQ_update_ok")
	public String myQ_update_ok(Model model,BoardVO vo,HttpServletRequest request, HttpServletResponse response){
		int board_no=vo.getBoard_no();
		vo.setHit(vo.getHit()-2);
		try {
			
			ms.myQ_update(vo);			
			model.addAttribute("board_no",board_no);
		} catch (Exception e) {
			e.getStackTrace();
			System.out.println(e.getMessage());
		}		
		return "redirect:myQcontent.do?board_no="+board_no;
	}
}
