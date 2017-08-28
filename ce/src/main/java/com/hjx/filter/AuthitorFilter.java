package com.hjx.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;

public class AuthitorFilter implements Filter {


	/**   
	* 需要排除的页面   
	*/    
	  
	private String excludedPages;       
	private String[] excludedPageArray;  
	
	public void init(FilterConfig filterConfig) throws ServletException {
		excludedPages = filterConfig.getInitParameter("excludedPages");     
		if (StringUtils.isNotEmpty(excludedPages)) {     
		excludedPageArray = excludedPages.split(",");     
		}     
		return;     
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		
		boolean isExcludedPage = false;     
		for (String page : excludedPageArray) {//判断是否在过滤url之外     
			System.out.println(((HttpServletRequest) request).getServletPath());
			if(((HttpServletRequest) request).getServletPath().contains(page)){     
				isExcludedPage = true;   
				System.out.println("排除~");
				break;     
			}    
		}
		
		if (isExcludedPage) {//在过滤url之外     
			chain.doFilter(request, response);     
		} else {
			 System.out.println("不排除~");
			 HttpServletRequest req=(HttpServletRequest) request;
             HttpSession session=req.getSession();
             Object object=session.getAttribute("personMessage"); 
             Object object1=session.getAttribute("adminKey");
             String param=req.getParameter("param");  
             if(object!=null ||object1!=null ){
            	 chain.doFilter(request, response);
             }else {
            	 req.setAttribute("message", "请先登录！");
				 req.getRequestDispatcher("login.jsp").forward(request, response);
			}
		} 
	}


	public void destroy() {
		
		
	}
	
	

}
