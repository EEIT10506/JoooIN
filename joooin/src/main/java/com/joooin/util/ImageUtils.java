package com.joooin.util;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.sql.Blob;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.sql.rowset.serial.SerialBlob;

import org.apache.commons.lang3.ArrayUtils;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartFile;

public class ImageUtils {
	//將使用者上傳的圖片轉成Byte[]，傳入MutilpartFile
	public static Byte[] multipartFileToByteArray(MultipartFile multiFile) {
		byte[] b = null;
		try {
			b = multiFile.getBytes();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return ArrayUtils.toObject(b);
	}
	
	//將本地圖片轉成Byte[]，傳入/WEB-INF/resources/img中的「圖片名稱」，含「副檔名」
	public static Byte[] localImageToByteArray(String fileName, ServletContext context) {
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		String filePath = "/WEB-INF/resources/img/" + fileName;
		String root = context.getRealPath("/");
		root = root.substring(0, root.length()-1);
		String fileLoction = root + filePath;
		byte[] b = null;
		File file = new File(fileLoction);
		BufferedImage bi;
		
		System.out.println(filePath);
		try {
			bi = ImageIO.read(file);
			ImageIO.write(bi, "png", baos);
			b = baos.toByteArray();
			baos.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return ArrayUtils.toObject(b);
	}
	
	//將資料庫圖片型態Byte[]轉成網頁上要顯示的圖片，傳入Byte[]
	public static ResponseEntity<byte[]> byteArrayToImage(Byte[] byteArray) {
		byte[] media = null;
	    HttpHeaders headers = new HttpHeaders();
	    int len = 0;
	    
	    Byte[] objByte = byteArray;
	    byte[] priByte = ArrayUtils.toPrimitive(objByte);
	    try {
			Blob blob = new SerialBlob(priByte);
			len = (int) blob.length();
			media = blob.getBytes(1, len);
		} catch (Exception e) {
			e.printStackTrace();
		} 
	         
	    headers.setCacheControl(CacheControl.noCache().getHeaderValue());
	    MediaType mediaType = MediaType.valueOf("image/jpg");
	    System.out.println("mediaType =" + mediaType);
	    headers.setContentType(mediaType);
	    ResponseEntity<byte[]> responseEntity = 
	                new ResponseEntity<>(media, headers, HttpStatus.OK);
	    return responseEntity;
	}
}
