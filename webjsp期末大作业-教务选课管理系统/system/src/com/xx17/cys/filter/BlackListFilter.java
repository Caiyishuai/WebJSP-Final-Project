package com.xx17.cys.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

/**
 * Servlet Filter implementation class BlackListFilter
 */
@WebFilter("/BlackListFilter")
public class BlackListFilter implements Filter {

    /**
     * Default constructor. 
     */
    public BlackListFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here
		
		/*
		 * 过滤掉聊天中的黑名单词
		 */
		String[] wordlist = {"TMD","NMB"};
		String word = request.getParameter("message");
		//替换
		for(int i=0;i<wordlist.length;i++) {
			word = word.replace(wordlist[i], "dbq,我说脏话了！");
			//RequestDispatcher rd = request.getRequestDispatcher("char.jsp");
			//rd.forward(request, response);
		}
		request.setAttribute("message", word);
		
		
		// pass the request along the filter chain
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
