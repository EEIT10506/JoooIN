package com.joooin.system.member._27.websocket;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/member/my/chat")
public class WebSocketController {
	//websocket服务层调用类
    @Autowired
    private WebSocketService wsMessageService;
 
  //请求入口
    @RequestMapping(value="/TestWS",method=RequestMethod.GET)
    @ResponseBody
    public String TestWS(@RequestParam(value="userId", required=true) String userId,
    					 @RequestParam(value="message", required=true) String message){
    	System.out.println("收到发送请求，向用户{" + userId + "}的消息：{" + message + "}");
    	
        if(wsMessageService.sendToAllTerminal(userId, message)){
            return "发送成功";
        }else{
            return "发送失败";
        }   
    }
}
