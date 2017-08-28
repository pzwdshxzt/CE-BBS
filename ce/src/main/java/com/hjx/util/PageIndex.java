package com.hjx.util;

import java.io.Serializable;

public class PageIndex implements Serializable{
    /**
	 * 
	 */
	private static final long serialVersionUID = 2023664741472821320L;
	private long startindex;
    private long endindex;
    
	public PageIndex(long startindex, long endindex) {
		this.startindex = startindex;
		this.endindex = endindex;
	}
	public long getStartindex() {
		return startindex;
	}
	public void setStartindex(long startindex) {
		this.startindex = startindex;
	}
	public long getEndindex() {
		return endindex;
	}
	public void setEndindex(long endindex) {
		this.endindex = endindex;
	}
    
    public static PageIndex getPageIndex(long viewpagecount, int currentPage,long totalpage){
    	long startpage = currentPage - 
    		      ((viewpagecount % 2L == 0L) ? viewpagecount / 2L - 1L : 
    		      viewpagecount / 2L);
    		    long endpage = currentPage + viewpagecount / 2L;
    		    if (startpage < 1L) {
    		      startpage = 1L;
    		      if (totalpage >= viewpagecount)
    		        endpage = viewpagecount;
    		      else
    		        endpage = totalpage;
    		    }
    		    if (endpage > totalpage) {
    		      endpage = totalpage;
    		      if (endpage - viewpagecount > 0L)
    		        startpage = endpage - viewpagecount + 1L;
    		      else
    		        startpage = 1L;
    		    }
    		    return new PageIndex(startpage, endpage);
    }
}
