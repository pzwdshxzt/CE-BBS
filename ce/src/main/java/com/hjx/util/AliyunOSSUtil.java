package com.hjx.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.net.URL;
import java.util.Date;
import java.util.UUID;

import org.apache.log4j.Logger;

import com.aliyun.oss.OSSClient;
import com.aliyun.oss.model.PutObjectResult;

public class AliyunOSSUtil {
	
		
		static Logger logger = Logger.getLogger(AliyunOSSUtil.class);

	    // endpoint是访问OSS的域名。如果您已经在OSS的控制台上 创建了Bucket，请在控制台上查看域名。
	    // 如果您还没有创建Bucket，endpoint选择请参看文档中心的“开发人员指南 > 基本概念 > 访问域名”，
	    // 链接地址是：https://help.aliyun.com/document_detail/oss/user_guide/oss_concept/endpoint.html?spm=5176.docoss/user_guide/endpoint_region
	    // endpoint的格式形如“http://oss-cn-hangzhou.aliyuncs.com/”，注意http://后不带bucket名称，
	    // 比如“http://bucket-name.oss-cn-hangzhou.aliyuncs.com”，是错误的endpoint，请去掉其中的“bucket-name”。
	    private static String endpoint = "oss-cn-shanghai.aliyuncs.com";

	    // accessKeyId和accessKeySecret是OSS的访问密钥，您可以在控制台上创建和查看，
	    // 创建和查看访问密钥的链接地址是：https://ak-console.aliyun.com/#/。
	    // 注意：accessKeyId和accessKeySecret前后都没有空格，从控制台复制时请检查并去除多余的空格。
	    private static String accessKeyId = "LTAIVNnIIi8jXDRU";
	    private static String accessKeySecret = "qdvZ5KeLKVCpECnZdEADCLoumoM08m";

	    // Bucket用来管理所存储Object的存储空间，详细描述请参看“开发人员指南 > 基本概念 > OSS基本概念介绍”。
	    // Bucket命名规范如下：只能包括小写字母，数字和短横线（-），必须以小写字母或者数字开头，长度必须在3-63字节之间。
	    private static String bucketName = "ce-bysj";
	    
	    public static String addPic(File file,String key){
	    	// 创建OSSClient实例
	    	OSSClient ossClient = new OSSClient(endpoint, accessKeyId, accessKeySecret);
	    
	    	if (key==null) {
				return null;
			}else{
				try {
					// 上传文件流
					UUID uuid = UUID.randomUUID();
					key=uuid+key;
					InputStream	inputStream = new FileInputStream(file);
					PutObjectResult result=	ossClient.putObject(bucketName, key, inputStream);
					if (result!=null) {
						return key;
					}
					
				} catch (FileNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally {
					// 关闭client
					ossClient.shutdown();
				}
			}
			return null;
	    }

	    public static boolean deleteObject(String key){
	    	if (key==null) {
				return false;
			}else{
	    	OSSClient ossClient = new OSSClient(endpoint, accessKeyId, accessKeySecret);
	    	ossClient.deleteObject(bucketName,key);
	    	return true;
	    	}
	    	
	    }
	    
	    public static String getUrl(String key){
	    	if (key==null) {
	    		return null;
			}else{
		    	OSSClient ossClient = new OSSClient(endpoint, accessKeyId, accessKeySecret);
		    	Date expiration = new Date(new Date().getTime() + 3600 * 1000 * 24);
			    // 生成URL
			    URL url = ossClient.generatePresignedUrl(bucketName, key, expiration);
			    if (url != null) {
			      return url.toString();
			    }
			}
			return null;
	    }
	    
	    public static String modifyOSS(String oldKey,String newKey,File file){
	    	
	    	if (oldKey==null) {
				return null;
			}else{
		    	OSSClient ossClient = new OSSClient(endpoint, accessKeyId, accessKeySecret);
		    	ossClient.deleteObject(bucketName,oldKey);
				try {
					UUID uuid = UUID.randomUUID();
					newKey=uuid+newKey;
					InputStream inputStream = new FileInputStream(file);
					PutObjectResult result=	ossClient.putObject(bucketName, newKey, inputStream);
					if (result!=null) {
					
						return newKey;
					}
				} catch (FileNotFoundException e) {
					return null;
				}
			}
			return null;
	    }
}
