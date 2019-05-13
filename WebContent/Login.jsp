<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.ResourceBundle"%>
<%@ page import="com.fxs.util.*" %>
<%
ResourceBundle rb = ResourceBundle.getBundle("Casino");
System.out.println("querystring= " + request.getQueryString());

	String target = "";
	String result = "";
	String label = "email";
	
	target = request.getParameter(label);
	session = request.getSession();
	
	Person p=null;
	boolean found = false;
	ArrayList<Person> list;
	PoolAccess pool = new PoolAccess();
	list = pool.getPersonList();
	for (int i=0; i < list.size();i++) {
		p = list.get(i);
		System.out.println(p.getEmail());
		if (p.getEmail().equals(target)) {
			found = true;
			break;
		}
	}
	if (found) { 
		session.setAttribute("PersonID", String.valueOf(p.getId()));
		session.setAttribute("Moniker", p.getMoniker());
		result = rb.getString("authorized");
	} else { 
		result = rb.getString("email_unknown");
	}
	
%>    
    <div id="login-msg"><span><%=result%></span></div>
<%
System.out.println("Exiting LoginRequest");
%>