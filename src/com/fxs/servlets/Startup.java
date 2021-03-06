package com.fxs.servlets;

import java.io.IOException;
import java.util.Enumeration;
import java.util.MissingResourceException;
import java.util.ResourceBundle;

import javax.servlet.RequestDispatcher;
import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;

/**

 * Servlet implementation class Startup
 */
@WebServlet("/Startup")
public class Startup extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static Logger logger = Logger.getLogger("MyLogger");
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Startup() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		
	}
	/**
	 * @see Servlet#getServletConfig()
	 */
	public ServletConfig getServletConfig() {
		// TODO Auto-generated method stub
		return null;
	}

	/**
	 * @see Servlet#getServletInfo()
	 */
	public String getServletInfo() {
		// TODO Auto-generated method stub
		return null; 
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		try {// TODO Auto-generated method stub
			
			System.out.println("Starting version 1.0.7");
			
			
	        //PropertiesConfigurator is used to configure logger from properties file
	        PropertyConfigurator.configure("shit.properties");

			System.out.println("Logger class = " + Logger.class.toString());
		
			System.out.println("Log name is " + logger.getName());
			logger.info("I'm logging");

			
			if (logger.isInfoEnabled()) {
				System.out.println("INFO is enabled");
				logger.info("I'm infoing");				
			}
			else {
				System.out.println("INFO is not enabled");
			}

			if (logger.isDebugEnabled()) {
				logger.debug("I'm debugging");
			}
			else {
				System.out.println("DEBUG is not enabled");
			}
		}
		catch (Exception e) {
			System.out.println("Exception = " + e.getMessage());
		}
		Enumeration<String> ie = request.getParameterNames();
		if (ie.hasMoreElements()) {
			String s = ie.nextElement();
			System.out.println("Attribute name is " + s);
		}
		else {
			System.out.println("There are no Parameters");
		}
		
		Enumeration<String> rae =request.getAttributeNames();
		if (rae.hasMoreElements()) {
			String s = rae.nextElement();
			System.out.println("Request Attribute name is " + s);
		}
		else {
			System.out.println("Request has no Attributes");
		}
		
		
		
		ServletContext sc = request.getServletContext();
		String s1 = sc.getInitParameter("p1");
		Enumeration<String> ae = sc.getAttributeNames();
		if (ae.hasMoreElements()) {
			String s = ae.nextElement();
			System.out.println("Attribute name is " + s);
		}
		else {
			System.out.println("Servlet context has no Attributes");
		}
		String s2 = (String) sc.getAttribute("Version");
		System.out.println("Version=" + s2);

		HttpSession session = request.getSession(true);

		try {
		ResourceBundle rb = ResourceBundle.getBundle("PoolText");
		String str = rb.getString("test");
		System.out.println("test="+str);
		}
		catch (MissingResourceException e) {
			e.printStackTrace();
		}
		
		
        RequestDispatcher dispatcher = request.getRequestDispatcher("/Welcome.jsp");
        
        dispatcher.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
