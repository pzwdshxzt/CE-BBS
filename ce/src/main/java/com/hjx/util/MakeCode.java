package com.hjx.util;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.util.Random;

import com.hjx.core.model.CodeInfo;

public class MakeCode {

	  private static int width = 90;//验证码宽度
      private static int height = 25;//验证码高度
      private static int codeCount = 4;//验证码个数
      private static int lineCount = 35;//混淆线个数
      static char[] codeOne = {  '1', '2', '3', '4', '5', '6', '7', '8', '9' };
      static char[] codeSequence = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9' };
      static char[] codeOperator = { '+', '-','-','-','-','-','-','+','+','+','*','*','*', '+','+','+','+'};
	
      public static CodeInfo getCodeInfo(){
	
		CodeInfo codeInfo=new CodeInfo();
		//定义随机数类
        Random r = new Random();
        //定义存储验证码的类
        StringBuilder builderCode = new StringBuilder();
        //定义画布
        BufferedImage buffImg = new BufferedImage(width,height,BufferedImage.TYPE_INT_RGB);
        //得到画笔
        Graphics g = buffImg.getGraphics();
        //1.设置颜色,画边框
        g.setColor(Color.black);
        g.drawRect(0,0,width,height);
        //2.设置颜色,填充内部
        g.setColor(Color.white);
        g.fillRect(1,1,width-2,height-2);
        //3.设置干扰线
        g.setColor(Color.gray);
        for (int i = 0; i < lineCount; i++) {
            g.drawLine(r.nextInt(width),r.nextInt(width),r.nextInt(width),r.nextInt(width));
        }
        //4.设置验证码
        g.setColor(Color.blue);
        //4.1设置验证码字体
        g.setFont(new Font("宋体",Font.BOLD|Font.ITALIC,20));
        char c =1;
        String a="";
        String b="";
        int one=0;
        int two=0;
        char o=1;
        for (int i = 0; i < codeCount; i++) {
            if (i==0||i==1) {
            	c = codeOne[r.nextInt(codeOne.length)];
            	a = a+ String.valueOf(c);
			}
            if (i==2) {
	            c = codeOperator[r.nextInt(codeOperator.length)];
	            o=c;
			}
            if (i==3) {
	            c = codeSequence[r.nextInt(codeSequence.length)];
	            b = b+ String.valueOf(c);
			}
	            builderCode.append(c);
	            g.drawString(c+"",15*(i+1),15);
        }
          one = Integer.parseInt(a);
          two = Integer.parseInt(b);
        switch (o){
          case '+':  one=one+two;break;
          case '*':  one=one*two;break;
          case '-':  one=one-two;break;
          case 1:  System.out.println("没有运算！");
          default: System.out.println("没有这个运算符！");
        }
        String code= CommUtil.getMD5("md5+"+one);
        codeInfo.setBuffImg(buffImg);
        codeInfo.setCodeMd5(code);
        codeInfo.setPictype("png");
		return codeInfo;
	}
}
