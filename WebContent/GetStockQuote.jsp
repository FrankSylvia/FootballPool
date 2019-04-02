<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.fxs.util.*" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.io.InputStreamReader"  %>
<%@ page import="java.io.OutputStreamWriter"  %>
<%@ page import="java.net.URL"  %>
<%@ page import="java.net.URLConnection"  %>
<%@ page import="java.util.ArrayList"  %>
<%@ page import="java.util.List"  %>

<%
StringBuffer rawResponse = new StringBuffer();
StringBuffer name = new StringBuffer();
StringBuffer price = new StringBuffer();
try { 
       int x=0;
       String requestUrl = "http://www.webservicex.net/stockquote.asmx/GetQuote";
       String method = "POST";

       StringBuffer requestParams = new StringBuffer();
	   requestParams.append("symbol=" + request.getParameter("symbol"));	
//	   requestParams.append("symbol=TJX");	
       URL url = new URL(requestUrl);
       URLConnection urlConn = url.openConnection();
       urlConn.setUseCaches(false);
        
       // the request will return a response
       urlConn.setDoInput(true);

       if ("POST".equals(method)) {
           // set request method to POST
           urlConn.setDoOutput(true);
       } else {
           // set request method to GET
           urlConn.setDoOutput(false);
       }
        
           OutputStreamWriter writer = new OutputStreamWriter(urlConn.getOutputStream());
           writer.write(requestParams.toString());
           writer.flush();   
        
       // reads response, store line by line in an array of Strings
       BufferedReader reader = new BufferedReader(new InputStreamReader(urlConn.getInputStream()));
 
        String line = "";
        while ((line = reader.readLine()) != null) {
        	System.out.println("line-" + line);
            rawResponse.append(line);
        	System.out.println("raw-" + rawResponse.toString());
        }
        reader.close();
        
        name.append(rawResponse.toString());
    	System.out.println("after 0 " + name.toString());
		x = name.indexOf("&lt;Name&gt;") + 12;
    	System.out.println("after 1 x=" + x);
    	name = name.delete(0, x);
    	System.out.println("after 2 " + name.toString());
    	name = name.delete(name.indexOf("&lt;/Name&gt;"),name.length());
    	System.out.println("after 3 " + name.toString());
    	System.out.println(name.toString());    	

        price.append(rawResponse.toString());
    	System.out.println("after 0 " + price.toString());
		x = price.indexOf("&lt;Last&gt;") + 12;
    	System.out.println("after 1 x=" + x);
    	price = price.delete(0, x);
    	System.out.println("after 2 " + rawResponse.toString());
    	price = price.delete(price.indexOf("&lt;/Last&gt;"),price.length());
    	System.out.println("after 3 " + rawResponse.toString());
    	System.out.println(price.toString());    	

    	rawResponse.append("<tr><th>" + "Corporate Name" + "</th><th>" + "Last Price" + "</th></tr>");
    	rawResponse.append("<tr><td>" + name + "</td><td>" + price + "</td></tr>");
        
    	System.out.println(rawResponse.toString());
    }
	catch (Exception e) {
		e.printStackTrace();
	}
	finally {
		;
	}
%>
<table border="1">
<caption>Stock Quote for <%= request.getParameter("symbol") %></caption>    

<TR>
<th>Corporate Name</th>
<TH>Last Price</TH>
</TR>
<tr>
<td> <%= name %></td>
<td> <%= price %></td>
</table>
