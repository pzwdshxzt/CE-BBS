package com.hjx.test;

import java.util.Date;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hjx.model.Security;
import com.hjx.model.Topic;
import com.hjx.model.User;
import com.hjx.service.TopicService;
import com.hjx.util.PageResult;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:applicationContext.xml")
public class TopicTest {

	

	private static final Logger logger = Logger.getLogger(SercurityTest.class);

	private PageResult pr;
	@Autowired
	private TopicService topicService;
	@Test
	public void  AddTest(){
		
		Topic topic=new Topic();
		topic.setContent("真是难忘的一天！！");
		topic.setCreateTime(new Date());
		topic.setTitle("20170126");
		topicService.insertObject(topic);
	}
	
	@Test
	public void STest(){
		Topic topic=new Topic();
		topic.setTopicId(3);
		topic=topicService.getObject(topic.getTopicId());
		topicService.updateObject(topic);
		topic=topicService.getObject(3);
	}
}
