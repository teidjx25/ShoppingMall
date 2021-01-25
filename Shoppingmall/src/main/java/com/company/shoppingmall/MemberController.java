package com.company.shoppingmall;


import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.company.shoppingmall.dto.PageDTO;
import com.company.shoppingmall.dto.ProductDTO;
import com.company.shoppingmall.dto.memberDTO;
import com.company.shoppingmall.dto.orderDTO;
import com.company.shoppingmall.dto.order_cartDTO;
import com.company.shoppingmall.model.memberServiceImpl;
import com.company.shoppingmall.model.productService;
import com.company.shoppingmall.model.productServiceImpl;

@RequestMapping("/member/*")
@Controller	
public class MemberController {
	
	@Autowired
	private memberServiceImpl memberService;
	@Autowired
	private productServiceImpl productService;
	
	

	
		
	//회원가입
		@GetMapping("joinPage")
		public void joinPage() {

		}
		
		@PostMapping("insert")
		public String insert(memberDTO member) {
			memberService.insert(member);
			
			return "redirect:/member/loginPage";
		}
		//아이디 체크 폼
		@GetMapping("idCheck")
		public void idCheck() {
			
		}
		

		//아이디체크 로직
		@PostMapping("idCheck")
		@ResponseBody
		public String idCheck(String mId) {
			
			memberDTO member = memberService.idCheck(mId);
			String result="";
			if(member==null) result="success";//사용가능
			else			result="fail";
			return result;
		}
		//로그인폼
		@GetMapping("loginPage")
		public void loginPage() {
		
		}
		//로그인 체크
		@PostMapping("loginCheck")
		@ResponseBody//문자열을 돌려줘야 되므로
		public String login(HttpSession session, String mId, String mPassword) {
			String result="";
			memberDTO member = memberService.loginCheck(mId);
			if(member==null) {//회원아님 
				result="fail";
			}else if(member.getmPassword().equals(mPassword)) {//회원임
				//세션에 추가--> 서블릿 세션객체를 써줌HttpSession session
				int auth = member.getAuth();
				session.setAttribute("sessid", mId);
				session.setAttribute("auth", auth);
				result="success";
			}else {//비번오류
				result="passfail";
			}
			

			return result;
		}
		//로그아웃
		@GetMapping("logout")
		public String logout(HttpSession session) {
			session.invalidate();
			return "redirect:/member/loginPage";
		}
		//마이페이지
		@GetMapping("mypage")
		public void mypage(String strOrderorderPageNum,String strCartcartPageNum,Model model,HttpSession session) {
			String sessid = (String) session.getAttribute("sessid");
			
			memberDTO member = memberService.findById(sessid);
			//포인트에 따른 등급 변환-------------------------------------
			if(member.getmPoint()>=5000 && member.getmPoint()<15000) {
				member.setmClass("gold");
				memberService.update(member);
			}
			if(member.getmPoint()>=15000){
				member.setmClass("vip");
				memberService.update(member);
			}
			//-----------------------------------------------------------
			int orderTotalCount = productService.buyCount(member.getmId());
			int ttPrice = productService.sumCount(member.getmId());
			
					HashMap<String,Object> hm =new HashMap<>();
					

					//주문 페이징
					strOrderorderPageNum = (strOrderorderPageNum == null) ? "1" : strOrderorderPageNum ;
					int pageSize = 5;
					int pageBlock = 10;
					int orderPageNum = Integer.parseInt(strOrderorderPageNum);
					int orderPageCount = (int) Math.ceil((double) orderTotalCount / pageSize);
					int OrderStartPage = ((orderPageNum / pageBlock) - (orderPageNum % pageBlock == 0 ? 1 : 0)) * pageBlock + 1;
					int OrderEndPage = OrderStartPage + pageBlock - 1;
					if (OrderEndPage > orderPageCount) {
						OrderEndPage = orderPageCount;
					}
					PageDTO orderPageDto = new PageDTO();
					orderPageDto.setTotalCount(orderTotalCount);
					orderPageDto.setPageCount(orderPageCount);
					orderPageDto.setPageBlock(pageBlock);
					orderPageDto.setStartPage(OrderStartPage);
					orderPageDto.setEndPage(OrderEndPage);
					orderPageDto.setPageNum(orderPageNum);
					
					int orderStartRow =(orderPageNum-1)*pageSize;
					hm.put("startRow",orderStartRow);
					hm.put("pageSize", pageSize);
					
					
					hm.put("buyId", member.getmId());
					
					int cartTotalCount = productService.cartCount(member.getmId()); 
					int cttPrice = productService.sumCart(member.getmId());	
					
					HashMap<String,Object> hmcart =new HashMap<>();
					
					//System.out.println(cartTotalCount);
					
					//장바구니 페이징
					strCartcartPageNum = (strCartcartPageNum == null) ? "1" : strCartcartPageNum ;
		
					int cartPageNum = Integer.parseInt(strCartcartPageNum);
					int cartPageCount = (int) Math.ceil((double) cartTotalCount / pageSize);
					int CartStartPage = ((cartPageNum / pageBlock) - (cartPageNum % pageBlock == 0 ? 1 : 0)) * pageBlock + 1;
					int CartEndPage = CartStartPage + pageBlock - 1;
					if (CartEndPage > cartPageCount) {
						CartEndPage = cartPageCount;
					}
					PageDTO cartPageDto = new PageDTO();
					cartPageDto.setTotalCount(cartTotalCount);
					cartPageDto.setPageCount(cartPageCount);
					cartPageDto.setPageBlock(pageBlock);
					cartPageDto.setStartPage(CartStartPage);
					cartPageDto.setEndPage(CartEndPage);
					cartPageDto.setPageNum(cartPageNum);
					
					int cartStartRow =(cartPageNum-1)*pageSize;
					hmcart.put("startRow",cartStartRow);
					hmcart.put("pageSize", pageSize);
					
					
					hmcart.put("mId", member.getmId());
					
					
					
					List<orderDTO> lists = productService.buyList(hm);
					List<order_cartDTO> clists = productService.cartList(hmcart);
					//System.out.println(clists);

					
					//오더 리스트
					model.addAttribute("orderList", lists);
					//오더 갯수
					model.addAttribute("count", orderTotalCount);
					//오더 총 금액
					model.addAttribute("ttPrice", ttPrice);
							
					model.addAttribute("orderPageDto", orderPageDto);
					
					model.addAttribute("member", member);
					model.addAttribute("mClass", member.getmClass());
					
					//장바구니 리스트
					model.addAttribute("cartList", clists);
					//장바구니 갯수
					model.addAttribute("count", cartTotalCount);
					//장바구니 총 금액
					model.addAttribute("cttPrice", cttPrice);
						
					model.addAttribute("cartPageDto", cartPageDto);		

			
		}
		//수정페이지
		@GetMapping("memberPage")
		public void memberPage(Model model,HttpSession session) {
			String sessid = (String) session.getAttribute("sessid");
			memberDTO member = memberService.findById(sessid);
			
			
	 
			model.addAttribute("memberId", member.getmId());
			model.addAttribute("memberName", member.getmName());
			model.addAttribute("memberAddress", member.getmAddress());
			model.addAttribute("memberEmail", member.getmEmail());
			model.addAttribute("memberTel", member.getmTel());
		
			
		}
		//수정하기
		@PostMapping("update")
		public String update(memberDTO memberInp) {
			
			memberService.update(memberInp);

			return "redirect:/member/memberPage";
		}
		//회원 탈퇴
		@GetMapping("delete")
		public String delete(HttpSession session,String mId) {
			
			session.invalidate();
			memberService.delete(mId);
			order_cartDTO delCart = new order_cartDTO();
			
			//장바구니 목록 전부 삭제
			//구매 목록은 나중에 자료로 쓸수도 있으니 남겨둠
			delCart.setmId(mId);
			productService.cartDeleteAll(delCart);
			return "redirect:/";
		}
		
		
		@GetMapping("orderDetail")
		public void orderDetail(int num,Model model) {
			System.out.println("실행");
			orderDTO order = productService.OfindByNum(num);
			
			ProductDTO product = productService.findByNum(order.getBuyPN());
			
			
	 
			model.addAttribute("order", order);
			model.addAttribute("product", product);

		}
		
		//장바구니 수량 수정
		@PostMapping("cartUpdate")
		public String cartUpdate(HttpSession session,int pId,int cQTY) {
			String mId = (String) session.getAttribute("sessid");
			order_cartDTO cart = new order_cartDTO();
			cart.setcQTY(cQTY);
			cart.setmId(mId);
			cart.setpId(pId);
			//갯수를 0개로 보내면 삭제하겠다고 알아듣고 삭제시키기
			if(cQTY==0){
				productService.cartDeleteOne(cart);
			}
			productService.cartUpdate(cart);

			return "redirect:/member/mypage";
		}
		//장바구니 객체 하나 삭제
		@GetMapping("cartDeleteOne")
		public String cartDeleteOne(HttpSession session,int pId){
			String mId = (String) session.getAttribute("sessid");
			order_cartDTO cart = new order_cartDTO();
			cart.setmId(mId);
			cart.setpId(pId);
			//갯수를 0개로 보내면 삭제하겠다고 알아듣고 삭제시키기

			productService.cartDeleteOne(cart);

			return "redirect:/member/mypage";
		}
		//장바구니 삭제전부
		@GetMapping("cartDeleteAll")
		public String cartDeleteAll(HttpSession session) {
			String mId = (String) session.getAttribute("sessid");
			order_cartDTO cart = new order_cartDTO();
			cart.setmId(mId);

			productService.cartDeleteAll(cart);

			return "redirect:/member/mypage";
		}

}
