package com.joooin.system.member._27.websocket;

import java.io.IOException;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;
import org.springframework.web.socket.server.standard.SpringConfigurator;

@ServerEndpoint(value="/member/message/{userId}",configurator = SpringConfigurator.class)
public class WebSocketMessage {
	
    //记录每个用户下多个终端的连接
    private static Map<String, Set<WebSocketMessage>> userSocket = new HashMap<>();
 
    //需要session来对用户发送数据, 获取连接特征userId
    private Session session;
    private String userId;
   
    /**
     * @Title: onOpen
     * @Description: websocekt连接建立时的操作
     * @param @param userId 用户id
     * @param @param session websocket连接的session属性
     * @param @throws IOException
     */
    @OnOpen
    public void onOpen(@PathParam("userId") String userId,Session session) throws IOException{
        this.session = session;
        this.userId = userId;
        //根据该用户当前是否已经在别的终端登录进行添加操作
        if (userSocket.containsKey(this.userId)) {
            userSocket.get(this.userId).add(this); //增加该用户set中的连接实例
        }else {
            Set<WebSocketMessage> addUserSet = new HashSet<>();
            addUserSet.add(this);
            userSocket.put(this.userId, addUserSet);
        }
        System.out.println("WebSocket連線已開啟　Hash：" + this.userId);
    }
   
    /**
     * @Title: onClose
     * @Description: 连接关闭的操作
     */
    @OnClose
    public void onClose(){
        //移除当前用户终端登录的websocket信息,如果该用户的所有终端都下线了，则删除该用户的记录
        if (userSocket.get(this.userId).size() == 0) {
            userSocket.remove(this.userId);
        }else{
            userSocket.get(this.userId).remove(this);
        }
        System.out.println("WebSocket連線已關閉　Hash：" + this.userId);
    }
   
    /**
     * @Title: onMessage
     * @Description: 收到消息后的操作
     * @param @param message 收到的消息
     * @param @param session 该连接的session属性
     */
    @OnMessage
    public void onMessage(String message, Session session) {    
        //测试向客户端发送消息发送
    	message = message.replace("<", "&lt;")
    					 .replace(">", "&gt;")
    					 .replace("\n", "<br />");
        sendMessageToUser(this.userId, message);
    }
   
    /**
     * @Title: onError
     * @Description: 连接发生错误时候的操作
     * @param @param session 该连接的session
     * @param @param error 发生的错误
     */
    @OnError
    public void onError(Session session, Throwable error){
        error.printStackTrace();
    }
   
  /**
   * @Title: sendMessageToUser
   * @Description: 发送消息给用户下的所有终端
   * @param @param userId 用户id
   * @param @param message 发送的消息
   * @param @return 发送成功返回true，反则返回false
   */
    public Boolean sendMessageToUser(String userId,String message){
        if (userSocket.containsKey(userId)) {
            for (WebSocketMessage WS : userSocket.get(userId)) {
                try {
                    WS.session.getBasicRemote().sendText(message);
                } catch (IOException e) {
                    e.printStackTrace();
                    return false;
                }
            }
            return true;
        }
        return false;
    }
}
