package com.hjx.util;

import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;

/**
 * 
 * @author  pkd
 *
 */
public class ReflectUtils {
	

	
	public static <T> Class<T> getClassGenricType(final Class clazz) {
		return getClassGenricType(clazz, 0);
		}
	

	public static Class getClassGenricType(final Class clazz, final int index) {
		Type genType = clazz.getGenericSuperclass();
		if (!(genType instanceof ParameterizedType)) {
			return Object.class;
		}
		Type[] params = ((ParameterizedType)genType).getActualTypeArguments();
		if (index >= params.length || index < 0) {
			return Object.class;
		}
		if (!(params[index] instanceof Class)) {
			return Object.class;
		}
		return (Class) params[index];
	}
	
	
	
}
