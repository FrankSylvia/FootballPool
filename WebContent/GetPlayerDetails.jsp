<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.fxs.util.*" %>
<table>
<caption>Details</caption>    
<%
System.out.println("querystring= " + request.getQueryString());
PoolPlayer pp = null;
PoolAccess pool = new PoolAccess();

String cols[] = pool.getPlayerColumns();

pp = pool.getPlayerDetails(Integer.valueOf(request.getParameter("player")));

%>


<TR>
<TH><%= cols[1]%></TH>
<TH><%= cols[2]%></TH>
<TH><%= cols[3]%></TH>
</TR>
<TR>
<TD><%= pp.getMoniker() %></TD>
<TD><%= pp.getName() %></TD>
<TD><%= pp.getEmail() %></TD>
</TR>

</table>
