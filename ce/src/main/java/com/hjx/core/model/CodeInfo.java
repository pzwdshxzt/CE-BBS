package com.hjx.core.model;

import java.awt.image.BufferedImage;

public class CodeInfo {
	
	private BufferedImage  buffImg;
	private String pictype;
	private String codeMd5;
	public BufferedImage getBuffImg() {
		return buffImg;
	}
	public void setBuffImg(BufferedImage buffImg) {
		this.buffImg = buffImg;
	}
	public String getPictype() {
		return pictype;
	}
	public void setPictype(String pictype) {
		this.pictype = pictype;
	}
	public String getCodeMd5() {
		return codeMd5;
	}
	public void setCodeMd5(String codeMd5) {
		this.codeMd5 = codeMd5;
	}
	
	
}
