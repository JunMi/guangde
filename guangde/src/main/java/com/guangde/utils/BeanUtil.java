package com.guangde.utils;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

import javax.servlet.http.HttpServletRequest;

public class BeanUtil {

	@SuppressWarnings("unchecked")
	public static <T> T getBean(HttpServletRequest request, Class<?> cls) {

		T obj = null;
		try {
			Class<?> c = Class.forName(cls.getName());
			try {
				obj = (T) c.getConstructor().newInstance();
				Field[] fields = cls.getDeclaredFields();
				for (Field field : fields) {
					String fieldName = field.getName();

					String setMethodName = "set" + fieldName.substring(0, 1).toUpperCase() + fieldName.substring(1);
					String getMethodName = "get" + fieldName.substring(0, 1).toUpperCase() + fieldName.substring(1);
					// 获取无参的get方法
					Method getMethod = c.getMethod(getMethodName, null);
					// 利用无参有返回值的get方法获得对应的set方法（get方法返回类型与set方法参数录入类型一致）
					Method setMethod = c.getMethod(setMethodName, getMethod.getReturnType());

					String value = request.getParameter(fieldName);
					//Method method = cls.getDeclaredMethod(setMethod.toString());
					switch (getMethod.getReturnType().getName()) {
					case "int":
						setMethod.invoke(obj, Integer.parseInt(value));
						break;
					case "float":
						setMethod.invoke(obj, Float.parseFloat(value));
						break;
					case "double":
						setMethod.invoke(obj, Double.parseDouble(value));
						break;
					case "long":
						setMethod.invoke(obj, Long.parseLong(value));
						break;
					default:
						setMethod.invoke(obj, value);
					}
				}
				// method.invoke(obj, value);
			} catch (InstantiationException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IllegalArgumentException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (InvocationTargetException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (NoSuchMethodException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SecurityException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return obj;
	}
}
