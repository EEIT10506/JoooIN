package com.joooin.system.admin._03.controller;

import java.awt.image.BufferedImage;
import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;
import javax.servlet.http.HttpSession;

import org.apache.commons.collections4.map.HashedMap;
import org.apache.commons.lang3.ArrayUtils;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.joooin.model.MemberMainBean;
import com.joooin.system.admin._03.service.RegisterService;

@Controller
public class GoogleController {
	
	@Autowired
	RegisterService registerService;

	@RequestMapping(value = "/admin/googleLogin", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> googleLogin(@RequestParam("ID_Token") String ID_Token, HttpSession session)
			throws IOException, SQLException {
		Map<String,Object>map = new HashedMap<String,Object>();

		String posturl = "https://www.googleapis.com/oauth2/v3/tokeninfo?id_token=" + ID_Token;

		URL url = new URL(posturl);// 創建連結
		HttpsURLConnection connection = (HttpsURLConnection) url.openConnection();
		connection.setRequestMethod("GET"); // 設定請求方式

		int responseCode = connection.getResponseCode();

		System.out.println("\nSending 'GET' request to URL : " + url);
		System.out.println("Response Code : " + responseCode);

		connection.connect();
		
		BufferedReader in = new BufferedReader(
                new InputStreamReader(connection.getInputStream()));
        String inputLine;
        StringBuffer response = new StringBuffer();

        while ((inputLine = in.readLine()) != null) {
            response.append(inputLine);
        }
        in.close();

        //打印结果
        System.out.println(response.toString());
        
        JSONObject resJSON = new JSONObject(response.toString());
        
        String email = resJSON.getString("email").substring(0,resJSON.getString("email").lastIndexOf("@"));
        if(registerService.getMemberByEmail(resJSON.getString("email"))==null) {
        	System.out.println("bean="+registerService.getMemberByEmail(email));
        	MemberMainBean mmb = new MemberMainBean();
        	mmb.setEmail(resJSON.getString("email"));
        	mmb.setPassword("googlePassw0rd");//ID_Token太長
        	
        	String photoPath = resJSON.getString("picture");
        	System.out.println(photoPath);
        	
//        	--------------------------------url下載圖片----------------------------------
        	
        	File file = new File("C:" + File.separator + "resources" + File.separator + "images" + File.separator + "members" +  File.separator + email +  File.separator + "photo" +  File.separator);
        	
        	if(!file.exists()) {
        		file.mkdirs();
        	}
        	
        	String fileName_https = downloadImageFromUrl(photoPath,"C:" + File.separator + "resources" + File.separator + "images" + File.separator + "members" +  File.separator + email +  File.separator + "photo" , email);
        	
        	byte[] bytes;
        	File img = new File(fileName_https);
    		ByteArrayOutputStream baos = new ByteArrayOutputStream();
    		BufferedImage bi;
			bi = ImageIO.read(img);
			ImageIO.write(bi, "jpg", baos);
			bytes = baos.toByteArray();
			baos.close();
        	
            Byte[] memberImg = ArrayUtils.toObject(bytes);
        	System.out.println("fileName_https="+fileName_https);

        	System.out.println("memberImg="+memberImg);
        	
        	
//        	---------------------------------------------------------------------------
        	mmb.setMemberImage(memberImg);
        	mmb.setMemberName(resJSON.getString("given_name"));
        	mmb.setGender("male");
        	mmb.setBirthday("2018-10-22");
        	mmb.setCity("臺北市");
        	mmb.setPhone("0987654321");
        	mmb.setLogins(0);
        	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd ahh:mm:ss");
			mmb.setMemberCreateDate(sdf.format(new Date()).toString());
			mmb.setCertificationStatus(true);
			mmb.setCertificationHash("Google");
			mmb.setGenderDisplay(false);
			mmb.setBirthdayDisplay(false);
			mmb.setCityDisplay(false);
			mmb.setEmailDisplay(false);
			mmb.setPhoneDisplay(false);
			registerService.googleSave(mmb);
			
			session.setAttribute("memberName", mmb.getMemberName());
			session.setAttribute("memberId", mmb.getMemberId());
			session.setAttribute("googleLogout", "登出");
        
            }else {
            	MemberMainBean mmb = registerService.getMemberByEmail(resJSON.getString("email"));
            	mmb.setCertificationStatus(true);
            	mmb.setCertificationHash("Google");
            	mmb.setLogins(mmb.getLogins()+1);
            	registerService.googleSave(mmb);
            	session.setAttribute("memberName", mmb.getMemberName());
    			session.setAttribute("memberId", mmb.getMemberId());
    			session.setAttribute("googleLogout", "登出");
            }
		return map;
	}
	
	public static HttpURLConnection getHttpURLConnectionFromHttps(String url) {
		HttpURLConnection httpUrlConnection = null;
		//建立一個信認所有憑證的X509TrustManager，放到TrustManager裡面
		TrustManager[] trustAllCerts;
		try {
			// Activate the new trust manager
			trustAllCerts = new TrustManager[] { new X509TrustManager() {

				public void checkClientTrusted(X509Certificate[] chain, String authType) throws CertificateException {					// TODO Auto-generated method stub
					//不作任何事
				}

				public void checkServerTrusted(X509Certificate[] chain, String authType) throws CertificateException {					// TODO Auto-generated method stub
					//不作任何事
				}

				public X509Certificate[] getAcceptedIssuers() {
					//不作任何事
					return null;
				}

			} };

			//設置SSL設定
			SSLContext sslContext = SSLContext.getInstance("SSL");
			sslContext.init(null, trustAllCerts, new java.security.SecureRandom());
			HttpsURLConnection.setDefaultSSLSocketFactory(sslContext.getSocketFactory());

			//跟HTTP一樣，用Url建立連線
			httpUrlConnection = (HttpURLConnection) (new URL(url)).openConnection();
		} catch (KeyManagementException e) {
			e.printStackTrace();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return httpUrlConnection;
	}
	
	public static String downloadImageFromUrl(String url, String fileDirectoryPath, String fileNameWithoutFormat) {
		String filePath = null;
		
		BufferedInputStream in = null;
		ByteArrayOutputStream out = null;
		HttpURLConnection httpUrlConnection = null;
		FileOutputStream file = null;

		try {
			
			if (url.startsWith("https://")) {
				//HTTPS時
				httpUrlConnection = getHttpURLConnectionFromHttps(url);
			}
			//如果不是HTTPS或是沒成功得到httpUrlConnection，用HTTP的方法
			if(httpUrlConnection == null) {
				httpUrlConnection = (HttpURLConnection) (new URL(url)).openConnection();
			}
			
			// 設置User-Agent，偽裝成一般瀏覽器，不然有些伺服器會擋掉機器程式請求
			httpUrlConnection.setRequestProperty("User-Agent",
					"Mozilla/5.0 (Linux; Android 4.2.1; Nexus 7 Build/JOP40D) AppleWebKit/535.19 (KHTML, like Gecko) Chrome/18.0.1025.166  Safari/535.19");
			httpUrlConnection.connect();

			String imageType;
			if (httpUrlConnection.getResponseCode() == 200) {
				//成功取得response，
				//取得contentType
				String contentType = httpUrlConnection.getHeaderField("Content-Type");
				// 只處理image的回應
				if ("image".equals(contentType.substring(0, contentType.indexOf("/")))) {
					//得到對方Server提供的圖片副檔名，如jpg, png等
					imageType = contentType.substring(contentType.indexOf("/") + 1);

					if (imageType != null && !"".equals(imageType)) {
						//由HttpUrlConnection取得輸入串流
						in = new BufferedInputStream(httpUrlConnection.getInputStream());
						out = new ByteArrayOutputStream();

						//建立串流Buffer
						byte[] buffer = new byte[1024];

						file = new FileOutputStream(new File(fileDirectoryPath + File.separator + fileNameWithoutFormat + "." + imageType));

						int readByte;
						while ((readByte = in.read(buffer)) != -1) {
							//輸出檔案
							out.write(buffer, 0, readByte);
						}						

						byte[] response = out.toByteArray();
						file.write(response);						

						//下載成功後，返回檔案路徑
						filePath = fileDirectoryPath + File.separator + fileNameWithoutFormat + "." + imageType;
					}
				}

			}
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			//關閉各種串流
			try {
				if (out != null) {
					out.close();
				}
				if (in != null) {
					in.close();
				}
				if (httpUrlConnection != null) {
					httpUrlConnection.disconnect();
				}
				if (file != null) {
					file.close();
				}
			}catch (IOException e) {
				e.printStackTrace();
			}
			
		}
		return filePath;
	}

}
