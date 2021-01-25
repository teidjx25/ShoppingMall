package com.company.shoppingmall;

import java.io.File;
import java.io.IOException;
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

import org.springframework.web.multipart.MultipartFile;

import com.company.shoppingmall.dto.ProductDTO;
import com.company.shoppingmall.dto.requestDTO;
import com.company.shoppingmall.model.memberServiceImpl;
import com.company.shoppingmall.model.productServiceImpl;
import com.company.shoppingmall.model.requestServiceImpl;

@RequestMapping("/question/*")
@Controller	
public class RequestController {
	
	@Autowired
	private productServiceImpl productService;
	
	@Autowired
	private requestServiceImpl requestService;

		
	//문의사항 입력페이지 이동
		@GetMapping("questionWrite")
		public void requestWrite(int pId, Model model) {

			ProductDTO product=productService.findByNum(pId);
			model.addAttribute("product", product);

		}
		

		//문의사항 insert
		@PostMapping("questionWrite")
		public String requestWrite(@ModelAttribute requestDTO requests, HttpServletRequest request)throws IOException {
					
					
			//파일 저장 경로 설정
			String saveDir = request.getSession().getServletContext().getRealPath("/");
			saveDir += "resources\\requestImg\\";

			MultipartFile f = requests.getUploadFile();	
			String fileName="";

			if(!f.isEmpty()) {
				String orifileName = f.getOriginalFilename();  
					
				UUID uuid= UUID.randomUUID();
				fileName = uuid+"_"+orifileName; 
				FileCopyUtils.copy(f.getBytes(), new File(saveDir+fileName));
				requests.setRequestImg(fileName);
			}
					
			requests.setReRef(requestService.max());
			requests.setReLev(0);
			requests.setReSeq(0);
					
			requestService.insert(requests);
					
			return "redirect:/productQuestion?pId="+requests.getBnum();
		}

		//문의사항 상세보기
		@GetMapping("questionDetail")
		public String questionDetail(int qnum, Model model,HttpSession session,String maker) {
			
			requestDTO request=requestService.findByNum(qnum);
			model.addAttribute("request", request);
			
			int memberAuth = (session.getAttribute("auth")==null?0:(int)session.getAttribute("auth"));
			String memberID = session.getAttribute("sessid")==null?"7":(String)session.getAttribute("sessid");
			
			String PathStr="/question/questionDetail";
			

			
			if(request.getState()==1) {	
			//권한이 관리자 or 작성자 본인 or 상품 주인
				if( memberAuth>1 || memberID.equals(request.getName()) || memberID.equals(maker)) {
					 PathStr ="/question/questionDetail";
				}else {
					 PathStr ="/question/questionLockDetail";
				}
			}else if(request.getState()==2) {
				//권한이 관리자만 볼수 있음
				if( memberAuth>1 ) {
					 PathStr ="/question/questionDetail";
				}else {
					 PathStr ="/question/questionDeleteDetail";
				}
			}
		
			return PathStr;
		}
		//문의사항 업데이트 폼 이동
		@GetMapping("questionUpdate")
		public void questionUpdate(int qnum, Model model) {
			requestDTO request=requestService.findByNum(qnum);
			model.addAttribute("request", request);
			
		}

		//문의사항 업데이트
		@PostMapping("questionUpdate")
		public String questionUpdate(@ModelAttribute requestDTO question, HttpServletRequest request)throws IOException {
			
			//1.해당글의 정보를 가져옴
			requestDTO question2 = requestService.findByNum(question.getQnum());
			
			int moveNum = question2.getBnum();
			
			//2.파일 저장 경로 설정 및 준비
			String saveDir = request.getSession().getServletContext().getRealPath("/");
					saveDir += "resources\\requestImg\\";
					//multipart
					MultipartFile f = question.getUploadFile();
					String fileName="";
			//3-1.새로운 파일이 존재한다면, 해당 파일 삭제 작업
					if(!f.isEmpty()) {
						new File(saveDir + request.getParameter("requestImg")).delete();
					if(f.isEmpty() && question2.getRequestImg()!=null) {
						new File(saveDir + request.getParameter("requestImg")).delete();
					}
			//4.새로운 파일 생성			
						String orifileName = f.getOriginalFilename();  //a.jpg
						//겹치지 않는 랜덤한 id생성
						UUID uuid= UUID.randomUUID();
						fileName = uuid+"_"+orifileName;  //111112222_a.jpg
					//	f.transferTo(new File(saveDir+fileName));
						FileCopyUtils.copy(f.getBytes(), new File(saveDir+fileName));
						question.setRequestImg(fileName);
					}else {
			//3-2. 새로운 파일이 존재 하지 않는 다면 원래값을 그대로 가져감			
						question.setRequestImg(question2.getRequestImg());
					}
			
			//5.수정 들어감.		
			System.out.println("수정");
			requestService.update(question);
			
			return  "redirect:/productQuestion?pId="+moveNum;
		}
		
		
	//문의사항 답글쓰기 이동
	@GetMapping("questionReply")
	public void questionReply(int qnum, Model model) {
		requestDTO request=requestService.findByNum(qnum);
		model.addAttribute("request", request);
			
	}
	//답글 입력
	@PostMapping("questionReply")
	public String questionReplyInsert(@ModelAttribute requestDTO requests) {
		

		requests.setReLev(1);
		requests.setReSeq(1);
				
		requestService.insert(requests);
		
		return "redirect:/productQuestion?pId="+requests.getBnum();
	}	
		
	@GetMapping("questionDelete")
	public String requestDelete(int qnum,int pId) {
		System.out.println("삭제");
		requestService.delete(qnum);
				
			
	return "redirect:/productQuestion?pId="+pId;
	}	

	@GetMapping("questionAdminDelete")
	public String questionAdminDelete(int qnum,int pId,int state) {
		requestDTO req = requestService.findByNum(qnum);
		req.setState(state);
		requestService.update(req);
				
			
	return "redirect:/productQuestion?pId="+pId;
	}	
	

}
