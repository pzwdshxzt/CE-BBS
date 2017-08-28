package com.hjx.util;

import java.awt.Rectangle;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Iterator;

import javax.imageio.ImageIO;
import javax.imageio.ImageReadParam;
import javax.imageio.ImageReader;
import javax.imageio.stream.ImageInputStream;

import com.hjx.core.model.Image;

public class ImageUtil {

	public static File cutImage(Image image){
		FileInputStream fis = null;  
        ImageInputStream iis = null;  
        
        try {
			fis=new FileInputStream(image.getFilePhoto());
			String ext = image.getFilePhotoFileName().substring(image.getFilePhotoFileName().lastIndexOf(".") + 1);  
		        
		    // ImageReader声称能够解码指定格式  
	        Iterator<ImageReader> it = ImageIO.getImageReadersByFormatName(ext);  
		    ImageReader reader = it.next();  
			      
		    // 获取图片流  
		    iis = ImageIO.createImageInputStream(fis);  
		    
		    // 输入源中的图像将只按顺序读取  
            reader.setInput(iis, true);  
            
         // 描述如何对流进行解码  
            ImageReadParam param = reader.getDefaultReadParam();  
            
            // 图片裁剪区域  
            Rectangle rect = new Rectangle(image.getX(),image.getY(),image.getWidth(),image.getHeight());  
            
         // 提供一个 BufferedImage，将其用作解码像素数据的目标  
            param.setSourceRegion(rect);  
           
         // 使用所提供的 ImageReadParam 读取通过索引 imageIndex 指定的对象  
            BufferedImage bi = reader.read(0, param);  
  
            File newfile = new File("c://tx//a.png");
         // 保存新图片  
            if (!newfile.exists()) {  
            	newfile.mkdirs();  
            }  
            
            ImageIO.write(bi, ext, newfile);  
            return newfile;
  

		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("没有文件！");
			return null;
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		} finally {  
            try {  
                if (fis != null) {  
                    fis.close();  
                }  
                if (iis != null) {  
                    iis.close();  
                }  
            } catch (IOException e) {  
                e.printStackTrace();  
                return null;  
            }  
        }
	}
	
	
}
