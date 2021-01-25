package com.company.shoppingmall;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Random;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.company.shoppingmall.dto.PageDTO;
import com.company.shoppingmall.dto.ProductDTO;
import com.company.shoppingmall.dto.memberDTO;
import com.company.shoppingmall.dto.orderDTO;
import com.company.shoppingmall.dto.order_cartDTO;
import com.company.shoppingmall.dto.requestDTO;
import com.company.shoppingmall.dto.reviewDTO;
import com.company.shoppingmall.model.memberServiceImpl;
import com.company.shoppingmall.model.productServiceImpl;
import com.company.shoppingmall.model.requestServiceImpl;
import com.company.shoppingmall.model.reviewServiceImpl;


@Controller
public class HomeController {
	

	
	@Autowired
	private productServiceImpl productService;
	
	@Autowired
	private reviewServiceImpl reviewService;
	
	@Autowired
	private requestServiceImpl requestService;
	
	@Autowired
	private memberServiceImpl memberService;
	
	public void productView(int pId,Model model) {
		ProductDTO product=productService.findByNum(pId);
		int reviewcount = reviewService.getCount(pId);
		
		//리뷰의 갯수가 0보다 크면 평균을 구함
		if(reviewcount>0) {
			int avgReview=reviewService.avgReview(pId);
			System.out.println(avgReview);
			model.addAttribute("avgReview", avgReview);
			
		}else {
			//크지 않으면 0으로 보냄
			model.addAttribute("avgReview", 0);
		}
		model.addAttribute("reviewcount", reviewcount);
		model.addAttribute("product", product);
	}
	public void List(String strPageNum,Model model,String field,String word,int promotion, int productType,int category) {
		HashMap<String,Object> hm =new HashMap<>();
		hm.put("field", field);
		hm.put("word", word);
		hm.put("promotion", promotion);
		hm.put("productType", productType);
		if(category!=0) {
			hm.put("category", category);
		}
		int totalCount = productService.getCount(hm);
		
		//페이징
				strPageNum = (strPageNum == null) ? "1" : strPageNum ;
				int pageNum = Integer.parseInt(strPageNum);
				int pageSize = 5;
				int pageBlock = 3;
				int pageCount = (int) Math.ceil((double) totalCount / pageSize);
				int startPage = ((pageNum / pageBlock) - (pageNum % pageBlock == 0 ? 1 : 0)) * pageBlock + 1;
				int endPage = startPage + pageBlock - 1;
				if (endPage > pageCount) {
					endPage = pageCount;
				}
				PageDTO pageDto = new PageDTO();
				pageDto.setTotalCount(totalCount);
				pageDto.setPageCount(pageCount);
				pageDto.setPageBlock(pageBlock);
				pageDto.setStartPage(startPage);
				pageDto.setEndPage(endPage);
				pageDto.setPageNum(pageNum);
				
				int startRow =(pageNum-1)*pageSize;
				hm.put("startRow",startRow);
				hm.put("pageSize", pageSize);
				
				
				List<ProductDTO> lists = productService.list(hm);
				
				model.addAttribute("category", category);
				model.addAttribute("promotion", promotion);
				model.addAttribute("productType", productType);
				model.addAttribute("productList", lists);
				model.addAttribute("count", totalCount);
				model.addAttribute("pageDto", pageDto);
				model.addAttribute("field", field);
				model.addAttribute("word", word);
	}
	
	

	
	//-----------------------------페이지 이동----------------------------------------------------------
	// 홈=행사 상품 모음집
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(String strPageNum,Model model,String field,String word) {
		List(strPageNum,model,field,word,1,1,0);
		return "home";
	}
	//일반 상품 모음집
	
	@GetMapping("productList")
	public String publicProduct(String strPageNum,Model model,String field,String word,int category) {
		List(strPageNum,model,field,word,0,1,category);
		return "productList";
	}
	
	//중고 상품 모음집
	@GetMapping("oldProductList")
	public String oldProduct(String strPageNum,Model model,String field,String word) {
		List(strPageNum,model,field,word,0,2,0);
		return "oldProductList";
	}
	//판매자 상품 모음집
	@GetMapping("ProductManager")
	public void ProductManager(HttpSession session,String strPageNum,Model model,String field,String word,String promotion) {
		String sessid = (String) session.getAttribute("sessid");
		HashMap<String,Object> hm =new HashMap<>();
		promotion = (promotion == null) ? "10" : promotion ;
		int intPro =Integer.parseInt(promotion);
		
		hm.put("field", field);
		hm.put("word", word);
	
		hm.put("promotion", intPro);
		hm.put("productType", 0);
		hm.put("category", null);
		hm.put("mId",sessid);
		int totalCount = productService.getCount(hm);
		
		//페이징
				strPageNum = (strPageNum == null) ? "1" : strPageNum ;
				int pageNum = Integer.parseInt(strPageNum);
				int pageSize = 5;
				int pageBlock = 3;
				int pageCount = (int) Math.ceil((double) totalCount / pageSize);
				int startPage = ((pageNum / pageBlock) - (pageNum % pageBlock == 0 ? 1 : 0)) * pageBlock + 1;
				int endPage = startPage + pageBlock - 1;
				if (endPage > pageCount) {
					endPage = pageCount;
				}
				PageDTO pageDto = new PageDTO();
				pageDto.setTotalCount(totalCount);
				pageDto.setPageCount(pageCount);
				pageDto.setPageBlock(pageBlock);
				pageDto.setStartPage(startPage);
				pageDto.setEndPage(endPage);
				pageDto.setPageNum(pageNum);
				
				int startRow =(pageNum-1)*pageSize;
				hm.put("startRow",startRow);
				hm.put("pageSize", pageSize);
				
				
				List<ProductDTO> lists = productService.list(hm);
				
				model.addAttribute("productList", lists);
				model.addAttribute("count", totalCount);
				model.addAttribute("pageDto", pageDto);
				model.addAttribute("field", field);
				model.addAttribute("word", word);
				model.addAttribute("category", null);
				model.addAttribute("manager", 12);
		
	}
	@GetMapping("ProductAdmin")
	public void ProductAdmin (String strPageNum,Model model,String field,String word,int pState) {
		if(pState==1) {	//프로모션 상품만 
			List(strPageNum,model,field,word,1,1,0);
			
		}else {		//프로모션 상품 아닌것만
			List(strPageNum,model,field,word,0,1,0);	
		}
		model.addAttribute("pState",pState);
	}
	//관리자 부적절한 상품 -> 삭제조치
	@GetMapping("AdminDelete") 
	public String ProductAdmin (Model model,int pId,String strPageNum,String field,String word,int pState) {
		ProductDTO upPro=productService.findByNum(pId);
		upPro.setPromotion(3);
		productService.update(upPro);
		model.addAttribute("pState",pState);
		return "redirect:/ProductAdmin?strPageNum="+strPageNum+"&field="+field+"&word="+word+"&pState="+pState;
	}
	//관리자 일반상품 -> 행사상품
	@GetMapping("AdminPromotion")
	public String AdminPromotion (Model model,int pId,String strPageNum,String field,String word,int pState) {
		ProductDTO upPro=productService.findByNum(pId);
		upPro.setPromotion(1);
		productService.update(upPro);
		model.addAttribute("pState",pState);
		return "redirect:/ProductAdmin?strPageNum="+strPageNum+"&field="+field+"&word="+word+"&pState="+pState;
	}
	//관리자 행사상품 -> 일반상품
	@GetMapping("AdminNotPromotion")
	public String AdminNotPromotion (Model model,int pId,String strPageNum,String field,String word,int pState) {
		ProductDTO upPro=productService.findByNum(pId);
		upPro.setPromotion(0);
		productService.update(upPro);
		model.addAttribute("pState",pState);
		return "redirect:/ProductAdmin?strPageNum="+strPageNum+"&field="+field+"&word="+word+"&pState="+pState;
	}
	@PostMapping("Discount")
	public String Discount(int pId, int discount) {
		ProductDTO product = productService.findByNum(pId);
		product.setDiscount(discount);
		productService.update(product);
		return "redirect:/ProductManager";
	}
 
	//-----------------------------상품 상세보기, 리뷰, 문의사항 페이지 이동----------------------------------------------------------	
	//상세보기페이지
	@GetMapping("productDetail")
	public String productDetail(int pId, Model model) {
		
		productView(pId,model);

		return "productDetail";
	}
	//리뷰페이지
	@GetMapping("productReview")
	public String Review(String strPageNum,int pId, Model model) {

		
		productView(pId,model);
		
		HashMap<String,Object> hm =new HashMap<>();

		
		int totalCount = reviewService.getCount(pId);
		
				//페이징
				strPageNum = (strPageNum == null) ? "1" : strPageNum ;
				int pageNum = Integer.parseInt(strPageNum);
				int pageSize = 5;
				int pageBlock = 3;
				int pageCount = (int) Math.ceil((double) totalCount / pageSize);
				int startPage = ((pageNum / pageBlock) - (pageNum % pageBlock == 0 ? 1 : 0)) * pageBlock + 1;
				int endPage = startPage + pageBlock - 1;
				if (endPage > pageCount) {
					endPage = pageCount;
				}
				PageDTO pageDto = new PageDTO();
				pageDto.setTotalCount(totalCount);
				pageDto.setPageCount(pageCount);
				pageDto.setPageBlock(pageBlock);
				pageDto.setStartPage(startPage);
				pageDto.setEndPage(endPage);
				pageDto.setPageNum(pageNum);
				
				int startRow =(pageNum-1)*pageSize;
				hm.put("startRow",startRow);
				hm.put("pageSize", pageSize);
				
				
				hm.put("pId", pId);
				
				List<reviewDTO> lists = reviewService.list(hm);

				
				//리뷰 리스트
				model.addAttribute("ReviewList", lists);
				//리뷰 숫자
				model.addAttribute("count", totalCount);
				model.addAttribute("pageDto", pageDto);

		
		return "productReview";
	}

 
	//문의사항페이지
	@GetMapping("productQuestion")
	public String Question(String strPageNum, int pId, Model model) {

		productView(pId,model);
		HashMap<String,Object> hm =new HashMap<>();

		
		int totalCount = requestService.getCount(pId);
		
		//페이징
		strPageNum = (strPageNum == null) ? "1" : strPageNum ;
		int pageNum = Integer.parseInt(strPageNum);
		int pageSize = 5;
		int pageBlock = 3;
		int pageCount = (int) Math.ceil((double) totalCount / pageSize);
		int startPage = ((pageNum / pageBlock) - (pageNum % pageBlock == 0 ? 1 : 0)) * pageBlock + 1;
		int endPage = startPage + pageBlock - 1;
		if (endPage > pageCount) {
				endPage = pageCount;
			}
		
		PageDTO pageDto = new PageDTO();
			pageDto.setTotalCount(totalCount);
			pageDto.setPageCount(pageCount);
			pageDto.setPageBlock(pageBlock);
			pageDto.setStartPage(startPage);
			pageDto.setEndPage(endPage);
			pageDto.setPageNum(pageNum);
				
			int startRow =(pageNum-1)*pageSize;
			hm.put("startRow",startRow);
			hm.put("pageSize", pageSize);
				
				
			hm.put("pId", pId);
				
		List<requestDTO> lists = requestService.list(hm);

				
				//리뷰 리스트
			model.addAttribute("RequestList", lists);
				//리뷰 숫자
			model.addAttribute("count", totalCount);
			model.addAttribute("pageDto", pageDto);
		
		return "productQuestion";
	}
	
	//상품 입력 폼 이동
	@GetMapping("uploadProduct")
	public String productSellingMove() {
		return "uploadProduct";
	}
	//상품 업데이트 폼 이동
	@GetMapping("productUpdate")
	public String productUpdateMove(int pId, Model model) {
		ProductDTO product=productService.findByNum(pId);
		model.addAttribute("product", product);
		return "productUpdate";
	}
	
	//-----------------------------상품 입력,수정,삭제----------------------------------------------------------	
	//상품 insert
	@PostMapping("uploadProduct")
	public String productSelling(@ModelAttribute ProductDTO product, HttpServletRequest request)throws IOException {
		
		
		//파일 저장 경로 설정
		String saveDir = request.getSession().getServletContext().getRealPath("/");
		saveDir += "resources\\productImg\\";

		//multipart
		MultipartFile f = product.getUploadFile();	//파일을 가져옴
		String fileName="";

		if(!f.isEmpty()) {
			String orifileName = f.getOriginalFilename();  //실제 파일의 이름
			//겹치지 않는 랜덤한 id생성
			UUID uuid= UUID.randomUUID();
			fileName = uuid+"_"+orifileName;  //111112222_a.jpg
		//	f.transferTo(new File(saveDir+fileName));
			FileCopyUtils.copy(f.getBytes(), new File(saveDir+fileName));
			product.setBimg(fileName);
		}
		

		product.setDiscount(0);
		product.setPromotion(0);
		productService.productInsert(product);
		return "redirect:/";
	}
 
	//상품 업데이트
	@PostMapping("productUpdate")
	public String productUpdate(@ModelAttribute ProductDTO product, HttpServletRequest request)throws IOException {
		
		//1.해당글의 정보를 가져옴
		ProductDTO product2 = productService.findByNum(product.getpId());
		System.out.println(product2.getBimg());
		
		//2.파일 저장 경로 설정 및 준비
		String saveDir = request.getSession().getServletContext().getRealPath("/");
				saveDir += "resources\\productImg\\";
				//multipart
				MultipartFile f = product.getUploadFile();
				String fileName="";
		//3-1.새로운 파일이 존재한다면, 해당 파일 삭제 작업
				if(!f.isEmpty()) {
					new File(saveDir + request.getParameter("bImg")).delete();
		//4.새로운 파일 생성			
					String orifileName = f.getOriginalFilename();  //a.jpg
					//겹치지 않는 랜덤한 id생성
					UUID uuid= UUID.randomUUID();
					fileName = uuid+"_"+orifileName;  //111112222_a.jpg
				//	f.transferTo(new File(saveDir+fileName));
					FileCopyUtils.copy(f.getBytes(), new File(saveDir+fileName));
					product.setBimg(fileName);
				}else {
		//3-2. 새로운 파일이 존재 하지 않는 다면 원래값을 그대로 가져감			
					product.setBimg(product2.getBimg());
				}
		
		//5.수정 들어감.		
		System.out.println("수정");
	    productService.update(product);
		
		return "redirect:/productList?category=0";
	}
	@GetMapping("productDelete")
	public String productDelete(int pId) {
		

		System.out.println("삭제");
		productService.delete(pId);
		
	
		return "redirect:/productList?category=0";
	}	
	//-------------------------------------------구매 관련-------------------------------------------------------------

	@GetMapping("buyProduct")
	private String buyProduct(Model model,HttpSession session,int pId) {
		ProductDTO product = productService.findByNum(pId);
		String buyerId = (String) session.getAttribute("sessid");
		memberDTO buyer = memberService.findById(buyerId);
		
		
		double fprice = (double)product.getpPrice();
		double price = (fprice*((100-product.getDiscount())/100.0));
		int price2= (int)Math.round(price);
		
		
		model.addAttribute("product", product);
		model.addAttribute("member", buyer);
		model.addAttribute("price", price2);
		return "/buyProduct";

	}

	//장바구니 모두 구입
			@PostMapping("buyProductAll")
			private String buyALLProduct(@ModelAttribute orderDTO order,HttpSession session) {
				//1.상품들을 가져오기
				HashMap<String,Object> hm =new HashMap<>();
				String sessid = (String) session.getAttribute("sessid");
				//세션의 mId 추출
				memberDTO member = memberService.findById(sessid);
				hm.put("mId", member.getmId());
				
				//장바구니 목록 가져오기
				List <order_cartDTO> buyList =productService.cartList(hm);
				
				
				ProductDTO pdto = new ProductDTO();
				double fprice=0.0;
				double price =0.0;
				
				Random uuid= new Random();
				
				for(order_cartDTO list: buyList) {
				    
				    pdto =productService.findByNum(list.getpId());
				    
				   //할인 적용 작업
					fprice = (double)pdto.getpPrice();
					price = (fprice*((100-pdto.getDiscount())/100.0));
					order.setTotalPrice((int)Math.round(price));
					order.setBuyPN(list.getpId());
					order.setBuyNum(list.getcQTY());
					//택배 코드
					String code = uuid.nextInt(9999)+"-"+ uuid.nextInt(9999)+"-"+uuid.nextInt(9999)+"-"+order.getIdbuyProduct();  
					order.setBuyCode(code);
					productService.buyProduct(order);
					
					//회원 포인트 증가
					int memberPoint =member.getmPoint()+ order.getTotalPrice()/20;
					member.setmPoint(memberPoint);
					memberService.update(member);
					
					//상품 판매된 재고 제거 
					int qty=pdto.getpQTY();
					pdto.setpQTY(qty-order.getBuyNum());
					
					//재고 0일시 단종 처리
					//if(qty-order.getBuyNum()<1) {
					//	product.setProductType(0);
					//}
					
					//상품 구입 카운트 1증가
					int pBuyCnt =pdto.getpBuyCnt();
					pdto.setpBuyCnt(pBuyCnt+1);
					
					productService.update(pdto);
					
				}
				order_cartDTO old = new order_cartDTO();
				old.setmId(sessid);
				productService.cartDeleteAll(old);

				return "redirect:/member/mypage";
			}
	
	@PostMapping("buyProduct")
	private String buyProduct1(@ModelAttribute orderDTO order) {
		
		ProductDTO product = productService.findByNum(order.getBuyPN());

		
		//송장번호 입력
		Random uuid= new Random();
		String code = uuid.nextInt(9999)+"-"+ uuid.nextInt(9999)+"-"+uuid.nextInt(9999)+"-"+order.getIdbuyProduct();  
		order.setTotalPrice(order.getTotalPrice()*order.getBuyNum());
		order.setBuyCode(code);
		productService.buyProduct(order);
		
		//회원 포인트 증가
		
		memberDTO member=memberService.findById(order.getBuyId());
		int memberPoint =member.getmPoint()+ order.getTotalPrice()/20;
		member.setmPoint(memberPoint);
		memberService.update(member);
		
		//상품 판매된 재고 제거 
		int qty=product.getpQTY();
		product.setpQTY(qty-order.getBuyNum());
		
		//재고 0일시 단종 처리
		//if(qty-order.getBuyNum()<1) {
		//	product.setProductType(0);
		//}
		
		//상품 구입 카운트 1증가
		int pBuyCnt =product.getpBuyCnt();
		product.setpBuyCnt(pBuyCnt+1);
		
		productService.update(product);
		return "redirect:/member/mypage";
	}
	//-------------------------------------------카트 관련-------------------------------------------------------------
	
	//장바구니 넣기
	@PostMapping("CartProduct")
	private String CartProduct(@ModelAttribute order_cartDTO orderCart) {
		order_cartDTO oldcart = productService.findbyMember(orderCart);
		if(oldcart==null) {
			productService.cartProduct(orderCart);
		}else {
			orderCart.setcQTY(oldcart.getcQTY()+orderCart.getcQTY());
			productService.cartUpdate(orderCart);
		}
		return "redirect:/member/mypage";
	}
	//장바구니 모두 구입 폼!
	@GetMapping("buyAllProduct")
	private void buyAllProduct(Model model,@ModelAttribute ProductDTO product,HttpSession session) {
		HashMap<String,Object> hm =new HashMap<>();
		String sessid = (String) session.getAttribute("sessid");
		memberDTO member = memberService.findById(sessid);
		hm.put("mId", member.getmId());
		
	
		List <order_cartDTO> buyList =productService.cartList(hm);
		List <ProductDTO> proList = new ArrayList<ProductDTO>();
		
		//입력전 임시 객체
		ProductDTO pdto = new ProductDTO();
		double fprice=0.0;
		double price =0.0;
		
		for(order_cartDTO list: buyList) {
		    
		    pdto =productService.findByNum(list.getpId());
		    pdto.setqQTY(list.getcQTY());
			fprice = (double)pdto.getpPrice();
			price = (fprice*((100-pdto.getDiscount())/100.0));
			pdto.setpPrice((int)Math.round(price));
			
			proList.add(pdto);
		   
		}
		int cttPrice = productService.sumCart(member.getmId());	
		model.addAttribute("member", buyList);
		model.addAttribute("pro", proList);
		model.addAttribute("member", member);
		model.addAttribute("cttPrice", cttPrice);
	
	}
	
}
