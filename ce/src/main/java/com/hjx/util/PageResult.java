package com.hjx.util;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

/**
 * 
 * @author pkd
 *
 * 
 */
public class PageResult implements Serializable {
	private static final long serialVersionUID = 9142640042556747848L;
	private List contents;
	private int startIndex;//开始记录数
	private int currentPage = 1;//当前页数
	private int pageSize;//每页记录条数
	private int totalCount;//总记录数
	private int totalPage;//总页数
	private int pagecode=ServiceConstants.PAGE_PAGE_CODE;//最多5个页码
	private PageIndex pageindex;//页码开始索引和结束索引
     
	public PageResult() {
	}

	public PageResult(int currentPage, int pageSize) {
		super();
		this.currentPage = currentPage;
		this.pageSize = pageSize;
	}

	public int getPagecode() {
		return pagecode;
	}

	public void setPagecode(int pagecode) {
		this.pagecode = pagecode;
	}

	public PageIndex getPageindex() {
		return pageindex;
	}

	public void setPageindex(PageIndex pageindex) {
		this.pageindex = pageindex;
	}

	public List getContents() {
		return this.contents;
	}

	public int getCurrentPage() {
		return this.currentPage;
	}

	public int getPageSize() {
		return this.pageSize;
	}

	public int getStartIndex() {
		return this.startIndex=(currentPage-1)*pageSize;
	}

	public int getTotalCount() {
		return this.totalCount;
	}

	public int getTotalPage() {
		return this.totalPage;
	}

	public void resetContents(Collection content) {
		List list = new ArrayList();
		list.addAll(content);
		setContents(list);
	}

	public void setContents(List content) {
		if (content == null)
			this.contents = new ArrayList(0);
		else
			this.contents = content;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public void setStartIndex(int currentIndex) {
		this.startIndex = currentIndex;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		setTotalPage(totalCount%pageSize>0?totalCount/pageSize+1:totalCount/pageSize);
	}

	public void setTotalPage(int countPage) {
		this.totalPage = countPage;
		this.pageindex=PageIndex.getPageIndex(pagecode, currentPage, totalPage);
	}
	
}