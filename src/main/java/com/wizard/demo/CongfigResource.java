package com.wizard.demo;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.lang.reflect.Method;
import java.net.URL;

/*
 * @author xiongxing
 */
public class CongfigResource {
	/**
	 * 读取classpath下的文件
	 * @param resource	资源路径	
	 * @return InputStream 文件的inputstram,如果找不到则返回null
	 */
	@SuppressWarnings("unchecked")
	public static InputStream loadConfigFile(String resource)
	{
		ClassLoader classLoader =  null;
	    try 
	    {
	    	Method method = Thread.class.getMethod("getContextClassLoader");
	    	classLoader =  (ClassLoader) method.invoke(Thread.currentThread());
	    }
	    catch (Exception e) 
	    {
	    	//debugLog.error("loadConfigFile error: ", e);
	    }
		if(classLoader == null)
		{
			classLoader = CongfigResource.class.getClassLoader(); 	
		}
		try 
		{
			if (classLoader != null) 
			{
				URL url = classLoader.getResource(resource);
				if(url == null){
					url = CongfigResource.class.getResource(resource);
				}
				if(url == null)
				{
					System.out.println("Can not find resource:"+ resource);
					return null;
				}
				if(url.toString().startsWith("jar:file:"))
				{
					System.out.println("Get resource \""+ resource + "\" from jar:\t" + url.toString());					
					return CongfigResource.class.getResourceAsStream(resource.startsWith("/") ? resource : "/"+ resource);
				}
				else
				{
					System.out.println("Get resource \""+ resource + "\" from:\t" + url.toString());					
					return new FileInputStream(new File(url.toURI()));
				}
			}			
		}
		catch(Exception e) 
		{
			//debugLog.error("loadConfigFile error: ", e);
		}
		return null;
	}
	
	public static String loadConfigFilePath(String resource)
	{
		ClassLoader classLoader =  null;
	    try 
	    {
	    	Method method = Thread.class.getMethod("getContextClassLoader");
	    	classLoader =  (ClassLoader) method.invoke(Thread.currentThread());
	    }
	    catch (Exception e) 
	    {
	    	//debugLog.error("loadConfigFile error: ", e);
	    }
		if(classLoader == null)
		{
			classLoader = CongfigResource.class.getClassLoader(); 	
		}
		try 
		{
			if (classLoader != null) 
			{
				URL url = classLoader.getResource(resource);
				if(url == null)
				{
					url = CongfigResource.class.getResource(resource);
				}
				
				if(url == null)
				{
					System.out.println("Can not find resource:"+ resource);
				}
				else
				{					
					return new File(url.toURI()).getAbsolutePath();
				}
			}			
		}
		catch(Exception e) 
		{
			e.printStackTrace();
		}
		return null;
	}
}
