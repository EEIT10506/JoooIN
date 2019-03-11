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
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;

public class ImageUtils {
	@Autowired
	static ServletContext context;
	
	public static Byte[] localImageToByteArray(String fileName) {
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		String filePath = "/WEB-INF/resources/img/" + fileName;
		String root = context.getRealPath("/");
		root = root.substring(0, root.length()-1);
		String fileLoction = root + filePath;
		byte[] b = null;
		File file = new File(fileLoction);
		BufferedImage bi;
		try {
			bi = ImageIO.read(file);
			ImageIO.write(bi, "png", baos);
			b = baos.toByteArray();
			baos.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
			Byte[] byteArray = ArrayUtils.toObject(b);
		return byteArray;
	}
	
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
