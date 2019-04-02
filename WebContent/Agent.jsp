<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.fxs.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="poolstyle.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<title>Agent</title>
<script>
function showPlayers(str)
{
var xmlhttp;    
if (str=="")
  {
  document.getElementById("txtHint").innerHTML="";
  return;
  }
if (window.XMLHttpRequest)
  {// code for IE7+, Firefox, Chrome, Opera, Safari
  xmlhttp=new XMLHttpRequest();
  }
else
  {// code for IE6, IE5
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
xmlhttp.onreadystatechange=function()
  {
  if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
    document.getElementById("txtHint").innerHTML=xmlhttp.responseText;
    }
  }
xmlhttp.open("GET","http://localhost:9080/FootballPool/GetPlayersForAgent.jsp?agent="+str,true);
xmlhttp.send();
}
</script>
</head>
<body>
<p id=para1>Agent Business</p>
<table>
<tr>
<td>
<div>
<form  action=""> 
<select name="customers" onchange="showPlayers(this.value)">
<option value="">Select an agent:</option>

<%
ArrayList<PoolAgent> list;
PoolAccess pool = new PoolAccess();

list = pool.getAgentList();
if (!list.isEmpty()) {
	for (int i=0;i<list.size();i++) {
		PoolAgent pa = list.get(i);
		System.out.println(pa.getMoniker());
%>
<option value="<%=pa.getId()%>"><%= pa.getMoniker() %></option>
<%		 
	}
}
else {
	System.out.println("list is empty");
}
%>
</select>
</form>
</div>
</td>
<td>
<div id="txtHint"></div>
</td>
</tr>
</table>
<p> </p>

<input type="button" value="Done" onclick="JavaScript:window.close()" />

</body>
</html>
