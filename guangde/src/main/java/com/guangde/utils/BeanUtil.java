package com.guangde.utils;

import java.beans.PropertyDescriptor;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.BeansException;
import org.springframework.beans.FatalBeanException;
import org.springframework.util.Assert;
import org.springframework.util.ClassUtils;

public class BeanUtil extends BeanUtils {

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
					// Method method =
					// cls.getDeclaredMethod(setMethod.toString());
					if (null != value) {
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

	public static void copyPropertiesIgnorNull(Object source, Object target, String... ignoreProperties) throws BeansException {
		copyProperties(source, target, null, ignoreProperties);
	}

	private static void copyProperties(Object source, Object target, Class<?> editable, String... ignoreProperties) {
		Assert.notNull(source, "Source must not be null");
		Assert.notNull(target, "Target must not be null");

		Class<?> actualEditable = target.getClass();
		if (editable != null) {
			if (!editable.isInstance(target)) {
				throw new IllegalArgumentException("Target class [" + target.getClass().getName()
						+ "] not assignable to Editable class [" + editable.getName() + "]");
			}
			actualEditable = editable;
		}
		PropertyDescriptor[] targetPds = getPropertyDescriptors(actualEditable);
		List<String> ignoreList = (ignoreProperties != null) ? Arrays.asList(ignoreProperties) : null;

		for (PropertyDescriptor targetPd : targetPds) {
			Method writeMethod = targetPd.getWriteMethod();
			if (writeMethod != null && (ignoreProperties == null || (!ignoreList.contains(targetPd.getName())))) {
				PropertyDescriptor sourcePd = getPropertyDescriptor(source.getClass(), targetPd.getName());
				if (sourcePd != null) {
					Method readMethod = sourcePd.getReadMethod();
					if (readMethod != null && ClassUtils.isAssignable(writeMethod.getParameterTypes()[0],
							readMethod.getReturnType())) {
						try {
							if (!Modifier.isPublic(readMethod.getDeclaringClass().getModifiers())) {
								readMethod.setAccessible(true);
							}
							Object value = readMethod.invoke(source);

							// 只拷贝不为null的属性 by zhao
							if (null != value) {
								if (!Modifier.isPublic(writeMethod.getDeclaringClass().getModifiers())) {
									writeMethod.setAccessible(true);
								}
								writeMethod.invoke(target, value);
							}
							
						} catch (Throwable ex) {
							throw new FatalBeanException(
									"Could not copy property '" + targetPd.getName() + "' from source to target", ex);
						}
					}
				}
			}
		}
	}

}
