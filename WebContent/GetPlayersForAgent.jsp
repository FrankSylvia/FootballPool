<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.fxs.util.*" %>
<table>    
<%
//System.out.println("querystring= " + request.getQueryString());
//System.out.println("getting players for " + request.getParameter("agent"));
ArrayList<PoolPlayer> list = null;
PoolAccess pool = new PoolAccess();

//list = pool.getPlayersForAgent(Integer.valueOf(request.getParameter("agent")));
list = pool.getPlayersForAgent(1);

System.out.println("got players for " + request.getParameter("agent"));

if (!list.isEmpty()) {
	for (int i=0;i<list.size();i++) {
		PoolPlayer pp = list.get(i);
%>
<TR> <TD><%= pp.getMoniker() %></TD> </TR>
<%		 
	}
}

%>
</table>
