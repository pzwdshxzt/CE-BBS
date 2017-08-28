package com.hjx.test;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hjx.model.Flate;
import com.hjx.service.FlateService;
import com.hjx.util.AliyunOSSUtil;
import com.hjx.util.PageResult;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:applicationContext.xml")
public class FlateTest {
	private static final Logger logger = Logger.getLogger(FlateTest.class);

	private PageResult pr;
	private List<Flate> flates;
	@Autowired
	private FlateService flateService;
	
	@Test
	public void AddTest(){
		Flate flate=new Flate();
		flate.setFlateName("开心一下");
		flate.setFlateContent("笑话，说明");
		flateService.insertObject(flate);
	}

	@Test
	public void test(){
		Map map = new HashMap();
		map.put("delete", (byte)0);
		pr=flateService.queryHql(getHql("zbkcx"), getHql("zbkcql"), map, 0, 5);
		flates=pr.getContents();
		for(Flate flate:flates){
			flate.setImageUrl(AliyunOSSUtil.getUrl(flate.getImageUrl()));
		}
		for(Flate flate:flates){
			System.out.println(flate.getImageUrl());
		}
	}
	
	@Test
	public void testUpdate(){
		Flate flate=flateService.getObject(26);
		flate.setFlateName("娱乐");
		flateService.updateObject(flate);
		flate=null;
		flate=flateService.getObject(26);
		System.out.println(flate.getFlateName());
	}
	
	public String getHql(String param){
		String sql=null;
		if (param.equals("zbkcx")) {
			sql="from Flate s where s.deleteFlag =:delete";
		}
		if (param.equals("zbkcql")) {
			sql="select count(*) from Flate s where s.deleteFlag =:delete ";
		}
		return sql;
	}
}
