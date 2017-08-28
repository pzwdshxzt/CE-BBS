package com.hjx.core.model;

import java.io.File;

public class Image {

	private File filePhoto;
	private String filePhotoFileName;
	private String filePhotoContentType;
	private int x;
	private int y;
	private int width;
	private int height;

	
	public File getFilePhoto() {
		return filePhoto;
	}
	public void setFilePhoto(File filePhoto) {
		this.filePhoto = filePhoto;
	}
	public String getFilePhotoFileName() {
		return filePhotoFileName;
	}
	public void setFilePhotoFileName(String filePhotoFileName) {
		this.filePhotoFileName = filePhotoFileName;
	}
	public String getFilePhotoContentType() {
		return filePhotoContentType;
	}
	public void setFilePhotoContentType(String filePhotoContentType) {
		this.filePhotoContentType = filePhotoContentType;
	}
	public int getX() {
		return x;
	}
	public int getY() {
		return y;
	}
	public int getWidth() {
		return width;
	}
	public int getHeight() {
		return height;
	}
	public void setX(int x) {
		this.x = x;
	}
	public void setY(int y) {
		this.y = y;
	}
	public void setWidth(int width) {
		this.width = width;
	}
	public void setHeight(int height) {
		this.height = height;
	}

	
	
	
	
}
