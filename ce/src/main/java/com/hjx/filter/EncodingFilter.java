package com.hjx.filter;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

public class EncodingFilter implements Filter {
	private String encoding;

	
	public void init(FilterConfig filterConfig) throws ServletException {
		  encoding= filterConfig.getInitParameter("encoding");
		   if(encoding==null)
			   encoding="utf-8";
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		    HttpServletRequest req=(HttpServletRequest) request;
		                  String method=req.getMethod();//获取请求方式
		    if(method.equalsIgnoreCase("post"))  //请求方式是Post
		       request.setCharacterEncoding(encoding);//处理post请求。
		    if(method.equalsIgnoreCase("get"))//处理get请求乱码
		    {
		    	request=new EncodingRequest((HttpServletRequest) request);
		    }		  
	       System.out.println(request.getClass());		   
		   chain.doFilter(request, response);	
	}


	 @Override
	public void destroy() {
		
	}


	private class EncodingRequest extends  HttpServletRequestWrapper
	 {
              
		public EncodingRequest(HttpServletRequest request) {
			super(request);
			
		}
          @Override
        public String getParameter(String name) {
        	  String value=  super.getParameter(name);
        	  try {
        		  if(value!=null)
				value=new String(value.getBytes("iso-8859-1"),encoding);
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 	  
        	return value;
        }
	 }
	
	

}
