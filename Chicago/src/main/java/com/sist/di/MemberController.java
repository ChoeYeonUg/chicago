package com.sist.di;

import java.util.*;

import com.sist.dao.*;
import com.sist.service.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
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
	public String member_page(Model model, HttpServletRequest request) throws Exception {
		
		model.addAttribute("jsp", "member.jsp");
		model.addAttribute("member_jsp", "../member/MemberMain.jsp");
		
		model.addAttribute("MemberMain_cmi", "../MemberMain.jsp");
		model.addAttribute("cmi", "../member/MemberMainHome.jsp");
		
		return "main/main";
		
	}
	
	/* Secure Page */
	@RequestMapping(value="membersecurepwd_ok.do", method=RequestMethod.POST)
	public String membersecurepwd_ok(Model model, HttpServletRequest request, String USER_Check_PWD, String typecheck,
			RedirectAttributes redirectAttributes) throws Exception {
		
		HttpSession hs = request.getSession();
		String sessionid = (String)hs.getAttribute("id");
		String cpwd = ms.pwdCheck(sessionid);

		model.addAttribute("jsp", "member.jsp");
		model.addAttribute("member_jsp", "../member/MemberMain.jsp");
	
		model.addAttribute("MemberMain_cmi", "../MemberMain.jsp");
		
			if(USER_Check_PWD.equals(cpwd)) {
				if(typecheck.equals("mi")) {
					redirectAttributes.addFlashAttribute("check", "ok");
					/*MemberVO vo = ms.selectMember(sessionid);
					model.addAttribute("vo", vo);*/
					return "redirect:selectMemberInfo.do";
					
				} else if(typecheck.equals("ma")) {
					redirectAttributes.addFlashAttribute("check", "ok");
					/*AddressVO avo = ms.selectMemberDeliveryAddrs(sessionid);
					model.addAttribute("vo", avo);*/
					return "redirect:memberAddrsInfo.do";
					
				} else if(typecheck.equals("mo")) {
					redirectAttributes.addFlashAttribute("check", "ok");
					return "redirect:memberOrderList.do";
				}
			
			} 		
		
		return "redirect:membersecurepwd_ok.do";
		
	}
	
	/* Member Info HeadMenu */
	@RequestMapping("memberinfo.do")
	public String member_info_page(Model model, HttpServletRequest request) throws Exception {
		
		model.addAttribute("jsp", "member.jsp");
		model.addAttribute("member_jsp", "../member/MemberMain.jsp");
		
		model.addAttribute("MemberMain_cmi", "../MemberMain.jsp");
		model.addAttribute("cmi", "../member/MemberMainHome.jsp");
		
		return "main/main";
		
	}
	
	/* Member Info SideMenu Include */
	@RequestMapping("selectMemberInfo.do")
	public String member_side_info_page(Model model, HttpServletRequest request, String typecheck) throws Exception {
		model.addAttribute("jsp", "member.jsp");
		model.addAttribute("member_jsp", "../member/MemberMain.jsp");
		try{
			Map<String, ?> flashMap = RequestContextUtils.getInputFlashMap(request);
			String check = (String) flashMap.get("check");
			model.addAttribute("cmi", "../member/memberinfomodify/SelectMemberInfo.jsp");
			HttpSession hs = request.getSession();
			String sessionid = (String)hs.getAttribute("id");
			MemberVO vo = ms.selectMember(sessionid);
			model.addAttribute("vo", vo);
		}catch(Exception e){
			typecheck="mi";
			
			model.addAttribute("typecheck", typecheck);
			model.addAttribute("cmi", "../member/MemberSecurePassword.jsp");
			
		}
		
		return "main/main";
	}
	
	@RequestMapping("modyfyMemberInfo.do")
	public String modifymemberinfo_page(Model model, HttpServletRequest request) throws Exception {
		
		model.addAttribute("jsp", "member.jsp");
		model.addAttribute("member_jsp", "../member/MemberMain.jsp");
		
		model.addAttribute("MemberMain_cmi", "../MemberMain.jsp");
		model.addAttribute("cmi", "../member/MemberMainHome.jsp");
		
		return "main/main";
		
	}
	
	@RequestMapping(value="modyfyMemberInfo_ok.do", method=RequestMethod.POST)
	public String modyfyMemberInfo_ok(Model model, MemberVO vo, HttpServletRequest request, int zipcode, String addr, String email, String phone) throws Exception {
		
		logger.info(vo.getId() + " : " + vo.getPwd());
		
		HttpSession hs = request.getSession();
		String sessionid = (String) hs.getAttribute("id");
		
		model.addAttribute("jsp", "member.jsp");
		model.addAttribute("member_jsp", "../member/MemberMain.jsp");
		
		if(ms.memberId(sessionid) && !sessionid.equals("admin")) {
				
				vo = new MemberVO();
				vo.setZipcode(zipcode);
				vo.setAddr(addr);
				vo.setEmail(email);
				vo.setPhone(phone);
				vo.setId(sessionid);
				ms.modyfyMemberInfo(vo);
				
				model.addAttribute("jsp", "../main/main.jsp");
				
		} else {
			
			model.addAttribute("MemberMain_cmi", "MemberMain.jsp");
			model.addAttribute("cmi", "../memberinfomodify/ModifyMemderInfo.jsp");
			
		}
		
		return "redirect:modyfyMemberInfo.do";
		
	}
	
	@RequestMapping("modyfyMemberPwd.do")
	public String member_side_pwd_page(Model model, HttpServletRequest request) throws Exception {
		
		model.addAttribute("jsp", "member.jsp");
		model.addAttribute("member_jsp", "../member/MemberMain.jsp");
		
		model.addAttribute("MemberMain_cmi", "MemberMain.jsp");
		model.addAttribute("cmi", "../member/memberinfomodify/ModifyMemberPassword.jsp");
		
		return "main/main";
		
	}
	
	@RequestMapping(value="modyfyMemberPwd_ok.do", method=RequestMethod.POST)
	public String modyfyMemberPwd_ok(Model model, MemberVO vo, HttpServletRequest request,String USER_NewPWD, String USER_C_NewPWD) throws Exception {
		
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
				
				model.addAttribute("jsp", "../main/main.jsp");
				
			} else {
				
				model.addAttribute("MemberMain_cmi", "MemberMain.jsp");
				model.addAttribute("cmi", "../member/memberinfomodify/ModifyMemberPassword.jsp");
				
			}
			
		} else {
			
			model.addAttribute("MemberMain_cmi", "MemberMain.jsp");
			model.addAttribute("cmi", "../member/memberinfomodify/ModifyMemberPassword.jsp");
			
		}
		
		return "redirect:modyfyMemberInfo.do";
		
	}
	
	@RequestMapping("memberPoint.do")
	public String member_side_point_page(Model model, MemberVO vo, HttpServletRequest request) throws Exception {
		
		HttpSession hs = request.getSession();
		String sessionid = (String) hs.getAttribute("id");
		
		vo = ms.selectMember(sessionid);
		model.addAttribute("vo", vo);
		
		model.addAttribute("jsp", "member.jsp");
		model.addAttribute("member_jsp", "../member/MemberMain.jsp");
		
		model.addAttribute("MemberMain_cmi", "MemberMain.jsp");
		model.addAttribute("cmi", "../member/memberinfomodify/MemberPoint.jsp");
		
		return "main/main";
		
	}
	
	@RequestMapping("memberAddrsInfo.do")
	public String memberAddrsInfo_page(Model model, HttpServletRequest request) throws Exception {
		
		
		model.addAttribute("jsp", "member.jsp");
		model.addAttribute("member_jsp", "../member/MemberMain.jsp");
		
		try{
			Map<String, ?> flashMap = RequestContextUtils.getInputFlashMap(request);
			String check = (String) flashMap.get("check");
			model.addAttribute("cmi", "../member/memberinfomodify/MemberAddressInfo.jsp");
			HttpSession hs = request.getSession();
			String sessionid = (String)hs.getAttribute("id");
			AddressVO avo = ms.selectMemberDeliveryAddrs(sessionid);
			model.addAttribute("vo", avo);			
		}catch(Exception e){
			/*typecheck="ma";*/
			model.addAttribute("typecheck", "ma");
			model.addAttribute("cmi", "../member/MemberSecurePassword.jsp");
		}
		return "main/main";
		
	}
	
	@RequestMapping("insertMemberAddrs.do")
	public String insertMemberAddrsInfo_page(Model model, AddressVO avo, HttpServletRequest request) throws Exception {
		
		model.addAttribute("jsp", "member.jsp");
		model.addAttribute("member_jsp", "../member/MemberMain.jsp");
		
		model.addAttribute("MemberMain_cmi", "MemberMain.jsp");
		model.addAttribute("cmi", "../member/memberinfomodify/InsertMemberAddress.jsp");
		return "main/main";
		
	}
	
	@RequestMapping(value="insertMemberAddrs_ok.do", method=RequestMethod.POST)
	public String insertMemberAddrs_ok(Model model, AddressVO avo, HttpServletRequest request, int zipcode1, String addr1, int zipcode2, String addr2,int zipcode3, String addr3) throws Exception {
		
		logger.info(avo.getId());
		
		HttpSession hs = request.getSession();
		String sessionid = (String) hs.getAttribute("id");
		
		model.addAttribute("jsp", "member.jsp");
		model.addAttribute("member_jsp", "../member/MemberMain.jsp");
		
		if(ms.memberId(sessionid) && !sessionid.equals("admin")) {
			
			avo = new AddressVO();
			avo.setZipcode1(zipcode1);
			avo.setAddr1(addr1);
			avo.setZipcode2(zipcode2);
			avo.setAddr2(addr2);
			avo.setZipcode3(zipcode3);
			avo.setAddr3(addr3);
			avo.setId(sessionid);
			ms.insertMemberDeliveryAddrs(avo);
			
			model.addAttribute("MemberMain_cmi", "MemberMain.jsp");
			model.addAttribute("cmi", "../member/memberinfomodify/MemberAddressInfo.jsp");
			
		} else {
			
			model.addAttribute("MemberMain_cmi", "MemberMain.jsp");
			model.addAttribute("cmi", "../member/MemberMainHome.jsp");
			
		}
		
		return "redirect:memberAddrsInfo.do";
		
	}
	
	@RequestMapping("modifyMemberAddrs.do")
	public String modifyMemberAddrsInfo_page(Model model, AddressVO avo, HttpServletRequest request) throws Exception {
		
		model.addAttribute("jsp", "member.jsp");
		model.addAttribute("member_jsp", "../member/MemberMain.jsp");
		
		model.addAttribute("MemberMain_cmi", "MemberMain.jsp");
		model.addAttribute("cmi", "../member/memberinfomodify/ModifyMemberAddress.jsp");
		return "main/main";
		
	}
	
	@RequestMapping(value="modyfyMemberAddrs_ok.do", method=RequestMethod.POST)
	public String modyfyMemberAddrs_ok(Model model, AddressVO avo, HttpServletRequest request, int zipcode1, String addr1, int zipcode2, String addr2,int zipcode3, String addr3) throws Exception {
		
		logger.info(avo.getId());
		
		HttpSession hs = request.getSession();
		String sessionid = (String) hs.getAttribute("id");
		
		model.addAttribute("jsp", "member.jsp");
		model.addAttribute("member_jsp", "../member/MemberMain.jsp");
		
		if(ms.memberId(sessionid) && !sessionid.equals("admin")) {
			
			avo = new AddressVO();
			avo.setZipcode1(zipcode1);
			avo.setAddr1(addr1);
			avo.setZipcode2(zipcode2);
			avo.setAddr2(addr2);
			avo.setZipcode3(zipcode3);
			avo.setAddr3(addr3);
			avo.setId(sessionid);
			ms.modyfyMemberDeliveryAddrs(avo);
			
			model.addAttribute("MemberMain_cmi", "MemberMain.jsp");
			model.addAttribute("cmi", "../member/memberinfomodify/MemberAddressInfo.jsp");
			
		} else {
			
			model.addAttribute("MemberMain_cmi", "MemberMain.jsp");
			model.addAttribute("cmi", "../member/MemberMainHome.jsp");
			
		}
		
		return "redirect:memberAddrsInfo.do";
		
	}
	
	@RequestMapping("withdrawMember.do")
	public String member_side_withdraw_page(Model model, HttpServletRequest request) {
		
		model.addAttribute("jsp", "member.jsp");
		model.addAttribute("member_jsp", "../member/MemberMain.jsp");
		
		model.addAttribute("MemberMain_cmi", "MemberMain.jsp");
		model.addAttribute("cmi", "../member/memberinfomodify/WithdrawMember.jsp");
		
		return "main/main";
		
	}
	
	@RequestMapping(value="withdrawMember_ok.do", method=RequestMethod.POST)
	public String withdrawMember_ok(Model model, MemberVO vo, HttpServletRequest request,String USER_PWD, String USER_C_PWD) throws Exception {
		
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
	
	
	

	
	
	
	
	

	
	
	
	
	
	/* Member Wishlist HeadMenu */ 
	@RequestMapping("wish.do")
	public String member_wish_page(Model model, HttpServletRequest request) {
		
		model.addAttribute("jsp", "member.jsp");
		model.addAttribute("member_jsp", "../member/MemberMain.jsp");
		
		model.addAttribute("MemberMain_cmi", "MemberMain.jsp");
		model.addAttribute("cmi", "../member/memberwishlist/MemberWishList.jsp");
		
		return "main/main";
		
	}
	
	
	
	/* Member Question HeadMenu */ 
	@RequestMapping("memberquestion.do")
	public String member_question_page(Model model, HttpServletRequest request) {
		
		model.addAttribute("jsp", "member.jsp");
		model.addAttribute("member_jsp", "../member/MemberMain.jsp");
		
		model.addAttribute("MemberMain_cmi", "MemberMain.jsp");
		model.addAttribute("cmi", "../member/memberquestion/MemberQuestionMain.jsp");
		
		return "main/main";
		
	}
	
}
