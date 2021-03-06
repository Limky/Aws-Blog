package com.spring.limky.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.type.IntegerTypeHandler;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.limky.model.Scrap;
import com.spring.limky.service.CmsService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class CmsController {
	
	private static final Logger logger = LoggerFactory.getLogger(CmsController.class);
	
	@Autowired
    CmsService cmsService;
	private Scrap scrapOne = new Scrap();
	private List<Scrap> scrapList = new ArrayList<Scrap>();
	
	
	private String  subjectArray[]  = {"android","ios","node","jsp","spring","js-jquery","mysql","database","network","os","java","algorithm","linux","aws","jenkins","kinect" };
	
	
	private String filteringURL(String subject){
			for(int i=0;i<subjectArray.length;i++){
				if(subjectArray[i].equals(subject))return subject;
			}
		
		return null;
	}
	
	@RequestMapping(value = "/scrap/{subject}", method = RequestMethod.GET)
	public String RequestAndroidController(Locale locale, Model model,HttpServletRequest request,@PathVariable String subject) {
		
		String URL = filteringURL(subject);
		logger.info("Welcome "+ URL +"! The client locale is {}.", locale);
		System.out.println("컨트롤러 "+ URL);
		if(URL == null)return "404";
		
		scrapList = cmsService.getScrapListService(subject);
			
		model.addAttribute("subject",request.getRequestURL().toString().split("/")[4]);
		model.addAttribute("scrapList",scrapList);
		
	
		return "scrap";
	}
	
	

	
	@RequestMapping(value = "/cms", method = RequestMethod.GET)
	public String RequestAwsController(Locale locale,HttpSession session, Model model) {
		logger.info("Welcome aws! The client locale is {}.", locale);
		
		System.out.println("/cms 컨트롤러");
	
		String success_id = (String)session.getAttribute("loginCheck");
	
		System.out.println("TEST:"+success_id);
		if(success_id == null)return "home";
	
		if(success_id.equals("Limky_")){
			return "cms";
		}
		
		return "home";
		
	}
	
	@RequestMapping(value = "/insertscrap", method = RequestMethod.POST)
	public String RequestInsertScrapController(Locale locale, Model model, HttpServletRequest request) {
		logger.info("Welcome aws! The client locale is {}.", locale);
		

	//	board.setDate("2017-17-17-14:14");
	//	scrapOne.setNum(1);
		System.out.println(getCurrentTime());
		scrapOne.setDate(getCurrentTime());
		scrapOne.setTitle(request.getParameter("title"));
		scrapOne.setSubject(request.getParameter("subject"));
		scrapOne.setContents(request.getParameter("contents"));
	

		System.out.println(scrapOne.toString());
		
		
		cmsService.insertScrapService(scrapOne);
		
		System.out.println("/insertscrap 컨트롤러");
		
	
		
		return "cms";
	}
	
	
	@RequestMapping(value = "/scrap/modifyscrap", method = RequestMethod.POST)
	public String RequestModifyScrapController(Locale locale, Model model, HttpServletRequest request) {
		logger.info("Welcome RequestModifyScrapController.", locale);

		scrapOne = cmsService.getModifidScrapService(request.getParameter("pk"));
	//	System.out.println("야미"+request.getParameter("pk"));
		System.out.println(scrapOne.toString());
			
		model.addAttribute("modifiedBoard",scrapOne);
		
		
		return "editcms";
	}
	
	
	
	@RequestMapping(value = "/scrap/updatescrap", method = RequestMethod.POST)
	public String RequestUpdateScrapController(Locale locale, Model model, HttpServletRequest request) {
		logger.info("Welcome RequestModifyScrapController.", locale);


		scrapOne.setNum(Integer.parseInt(request.getParameter("pk")));
		scrapOne.setDate(getCurrentTime());
		scrapOne.setTitle(request.getParameter("title"));
		scrapOne.setSubject(request.getParameter("subject"));
		scrapOne.setContents(request.getParameter("contents"));
	
		System.out.println(scrapOne.toString());
		
		 cmsService.updateScrapService(scrapOne);

		return "redirect:/"+"scrap/"+scrapOne.getSubject();
	}
	
	
	@RequestMapping(value = "/scrap/deletescrap", method = RequestMethod.POST)
	public String RequestDeleteScrapController(Locale locale, Model model, HttpServletRequest request) {
		logger.info("Welcome RequestDeleteScrapController.", locale);

		String subject = request.getParameter("subject");
			System.out.println(subject+request.getParameter("pk"));
		 cmsService.deleteScrapService(request.getParameter("pk"));

		return "redirect:/"+"scrap/"+subject;
	}
	

	public String getCurrentTime(){
		Calendar calendar = Calendar.getInstance();
		java.util.Date date = calendar.getTime();
		String today = (new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(date));
		return today;
		
	}
	
}
