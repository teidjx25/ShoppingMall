package com.company.shoppingmall;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.company.shoppingmall.dto.ProductDTO;
import com.company.shoppingmall.dto.reviewDTO;
import com.company.shoppingmall.model.productServiceImpl;
import com.company.shoppingmall.model.reviewServiceImpl;

@RequestMapping("/review/*")
@Controller	
public class ReviewController {
	
	@Autowired
	private productServiceImpl productService;
	
	@Autowired
	private reviewServiceImpl reviewService;
		
	//리뷰 입력페이지 이동
		@GetMapping("reviewWrite")
		public void reviewWrite(int pId, Model model) {

			ProductDTO product=productService.findByNum(pId);
			model.addAttribute("product", product);

		}
		

		//리뷰 insert
		@PostMapping("reviewWrite")
		public String reviewWrite(@ModelAttribute reviewDTO review, HttpServletRequest request)throws IOException {
					
					
			//파일 저장 경로 설정
			String saveDir = request.getSession().getServletContext().getRealPath("/");
			saveDir += "resources\\reviewImg\\";

			MultipartFile f = review.getUploadFile();	
			String fileName="";

			if(!f.isEmpty()) {
				String orifileName = f.getOriginalFilename();  
					
				UUID uuid= UUID.randomUUID();
				fileName = uuid+"_"+orifileName; 
				FileCopyUtils.copy(f.getBytes(), new File(saveDir+fileName));
				review.setReviewImg(fileName);
			}
					
			System.out.println(review.getBnum());		
			review.setReLev(0);
			review.setReSeq(0);
					
			reviewService.insert(review);
					
			return "redirect:/productReview?pId="+review.getBnum();
		}
		//리뷰 업데이트 폼 이동
		@GetMapping("reviewUpdate")
		public void reviewUpdateMove(int cnum, Model model) {
			reviewDTO review=reviewService.findByNum(cnum);
			model.addAttribute("review", review);
			
		}
		
		
		//상품 업데이트
			@PostMapping("reviewUpdate")
			public String reviewUpdate(@ModelAttribute reviewDTO review, HttpServletRequest request)throws IOException {
				
				//1.해당글의 정보를 가져옴
				reviewDTO review2 = reviewService.findByNum(review.getCnum());
				
				int moveNum = review2.getBnum();
				
				//2.파일 저장 경로 설정 및 준비
				String saveDir = request.getSession().getServletContext().getRealPath("/");
						saveDir += "resources\\reviewImg\\";
						//multipart
						MultipartFile f = review.getUploadFile();
						String fileName="";
				//3-1.새로운 파일이 존재한다면, 해당 파일 삭제 작업
						if(!f.isEmpty()) {
							new File(saveDir + request.getParameter("reviewImg")).delete();
				//4.새로운 파일 생성			
							String orifileName = f.getOriginalFilename();  //a.jpg
							//겹치지 않는 랜덤한 id생성
							UUID uuid= UUID.randomUUID();
							fileName = uuid+"_"+orifileName;  //111112222_a.jpg
						//	f.transferTo(new File(saveDir+fileName));
							FileCopyUtils.copy(f.getBytes(), new File(saveDir+fileName));
							review.setReviewImg(fileName);
						}else {
				//3-2. 새로운 파일이 존재 하지 않는 다면 원래값을 그대로 가져감			
							review.setReviewImg(review2.getReviewImg());
						}
				
				//5.수정 들어감.		
				System.out.println("수정");
				reviewService.update(review);
				
				return  "redirect:/productReview?pId="+moveNum;
			}
			
			@GetMapping("reviewDelete")
			public String reviewDelete(int cnum,int pId) {

				System.out.println("삭제");
				reviewService.delete(cnum);

				return "redirect:/productReview?pId="+pId;
			}	
			@GetMapping("reviewAdminDelete")
			public String reviewAdminDelete(int cnum,int pId,int reLev) {

				reviewDTO rev= reviewService.findByNum(cnum);
				rev.setReLev(reLev);
				reviewService.update(rev);

				return "redirect:/productReview?pId="+pId;
			}	


	

}
