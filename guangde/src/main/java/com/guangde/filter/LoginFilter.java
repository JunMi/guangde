package com.guangde.filter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.http.HttpStatus;
import org.springframework.web.filter.OncePerRequestFilter;

import com.guangde.vo.User;

public class LoginFilter extends OncePerRequestFilter {

	private static Logger logger = Logger.getLogger(LoginFilter.class);
	
	@Override
	protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain)
			throws ServletException, IOException {
		// 请求uri
		String uri = request.getRequestURI();
		logger.info("当前请求的URI===>"+uri);
		// 要过滤的uri集合
		String[] filterUri = new String[] { "user/set", "user/message", "user/index","user/activate" };
		boolean doFilter = true;

		for (String s : filterUri) {
			if (uri.indexOf(s) > 0) {
				doFilter = true;
				break;
			} else {
				// 不包含特殊请求，则放行
				doFilter = false;
			}
		}

		if (doFilter) {
			User user = (User) request.getSession().getAttribute("user");
			if (null == user) {
				boolean isAjaxRequest = isAjaxRequest(request);
				if(isAjaxRequest){
					response.setCharacterEncoding("UTF-8");
					response.sendError(HttpStatus.UNAUTHORIZED.value(), "您已经太长时间没有操作,请刷新页面");
					return;
				}
				response.sendRedirect("./login");
			} else {
				filterChain.doFilter(request, response);
				return;
			}
		} else {
			// 放行请求
			filterChain.doFilter(request, response);
		}
	}

	public static boolean isAjaxRequest(HttpServletRequest request) {
		String header = request.getHeader("X-Requested-With");
		if (header != null && "XMLHttpRequest".equals(header))
			return true;
		else
			return false;
	}

}
