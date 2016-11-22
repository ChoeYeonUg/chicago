package com.sist.di;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sist.dao.BookVO;
import com.sist.dao.MemberVO;
import com.sist.dao.OrdersVO;
import com.sist.service.BookService;
import com.sist.service.MemberService;
import com.sist.service.OrdersService;

@Controller
public class PurchaseController {
	
	@Resource(name="memberService")
	private MemberService ms;
	
	@Resource(name="bookService")
	private BookService bs;
	
	@Resource(name="ordersService")
	private OrdersService os;
	
	private static final Logger logger = LoggerFactory.getLogger(PurchaseController.class);
	
	@RequestMapping("purchase")
	public String purchsePage(Model model,String[] book_code, String[] amount, HttpServletRequest req, HttpServletResponse resp) {
		
		if(book_code == null || amount == null){
			return null;
		}
		
		int[] amountInt = new int[book_code.length];
		for(int i = 0 ; i < book_code.length ; i++){
			if(amount[i] == null || amount[i].equals("")){
				amountInt[i] = 1;
			}else{
				try{
					amountInt[i] = Integer.parseInt(amount[i]);
				}catch(Exception e){
					amountInt[i] = 1;
				}
			}
		}
		
		try {
			HttpSession hs = req.getSession();
			String id = (String) hs.getAttribute("id");
			
			MemberVO vo = ms.orderData(id);
			//사용자의 기본 정보를 넘겨줌
			model.addAttribute("vo", vo);
			
			//책에 관한 정보를 가져옴
			int price = 0;
			List<BookVO> list = new ArrayList<BookVO>();
			for(int i = 0; i < book_code.length ; i++){
				BookVO bVO = bs.purchase(book_code[i]);
				price += bVO.getPrice() * amountInt[i];
				if((bVO.getAmount()) <= 0){
					return "redirct:bookDetail.do?book_code="+book_code;
				}
				bVO.setAmount(amountInt[i]);
				list.add(bVO);
			}
			//소장하고 있는 수가 없으면
			
			String[] bookList = book_code;
			int[] bookCount = amountInt;
			
			int point = price/10;
			
			int deliveryFee = 0;
			if(price > 25000){
				deliveryFee = 0;
			}else{
				deliveryFee = 2500;
			}
			
			//총 금액은 배송비 포함임
			int totalPrice = price + deliveryFee;
			model.addAttribute("point", point);
			model.addAttribute("totalPrice", totalPrice);
			model.addAttribute("deliveryFee", deliveryFee);
			model.addAttribute("list", list);
			model.addAttribute("price", price);
			
			model.addAttribute("bookList", bookList);
			model.addAttribute("bookCount", bookCount);	
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
		model.addAttribute("jsp","book.jsp");
		model.addAttribute("book_jsp","../book/purchase.jsp");
	
		return "main/main";
	}
	
	@RequestMapping("purchase_ok")
	public String purchseokPage(Model model, OrdersVO vo, int[] bookCount, String[] bookList, HttpServletRequest req){
		
		HttpSession hs = req.getSession();
		
		String id = (String) hs.getAttribute("id");
		vo.setId(id);
		vo.setAccount_info(0);
		vo.setDelivery(1);
		
		try {
			os.orderProcess(bookList, bookCount, vo);
			List<String> sbList = (List<String>)hs.getAttribute("sbList");
			boolean bCheck = false;
			if(sbList != null){
				for(String book_code : sbList){
					for(String orderBook : bookList){
						if(book_code.equals(orderBook)){
							hs.removeAttribute("sbList");
							bCheck = true;
							break;
						}
					}
					if(bCheck) break;
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			/*e.printStackTrace();*/
			return "error/404";
		}
		
				
		return "redirect:main.do";
	}
}
