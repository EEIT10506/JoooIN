package com.joooin.system.member._27.controller;


import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.joooin.handler.WebSocketHandler;
import com.joooin.system.member._27.service.MemberService;

@Controller
public class MemberMessageController {
	@Autowired
	MemberService memberService;
	
    @Bean//这个注解会从Spring容器拿出Bean
    public WebSocketHandler infoHandler() {
        return new WebSocketHandler();
    }
	
	@RequestMapping(value = "/member/message", method = RequestMethod.GET)
	public String main(Model model, HttpSession session) {
		Integer memberId = (Integer)session.getAttribute("memberId");
		
		if (memberId != null) {
			model.addAttribute("myself", memberService.getMemberMainBean(memberId));
			model.addAttribute("friendList", memberService.getFriends(memberId));
			return "member/message";
		} else {
			return "not_login";
		}
	}
	
//	@RequestMapping("/websocket/send")
//    public @ResponseBody String send(HttpSession session) {
//        String memberId = (String)session.getAttribute("memberId");
//        
//        
//        infoHandler().sendMessageToUser(username, new TextMessage("你好，测试！！！！"));
//        return null;
//    }
	
	
}
