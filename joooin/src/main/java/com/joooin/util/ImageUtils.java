package com.joooin.util;

import java.sql.Blob;

import javax.sql.rowset.serial.SerialBlob;

import org.apache.commons.lang3.ArrayUtils;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;

public class ImageUtils {
	public static ResponseEntity<byte[]> byteArrayToImage(Byte[] byteArray) {
		byte[] media = null;
	    HttpHeaders headers = new HttpHeaders();
	    int len = 0;
	    
	    //Convert Byte[] to Blob
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
