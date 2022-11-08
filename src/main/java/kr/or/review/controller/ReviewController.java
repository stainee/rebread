package kr.or.review.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.review.model.service.ReviewService;
import kr.or.review.model.vo.Review;

@Controller
public class ReviewController {
	@Autowired
	private ReviewService service;
	
	@RequestMapping(value = "/reviewList.do")
	public String reviewList(Model model) {
		ArrayList<Review> list = service.reviewList();
		model.addAttribute("list",list);
		return "review/reviewList";
		
	}
}
