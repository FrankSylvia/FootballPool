<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.fxs.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="poolstyle.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Players</title>
<script>

function toggleModeButton() {
	if (document.getElementById("modeButton").value == "READ/update")
		document.getElementById("modeButton").value= "UPDATE/read";
	else
		document.getElementById("modeButton").value= "READ/update";
}
function save() {
	//alert("Save");
}
function showPlayers(str)
{
var xmlhttp;    
if (str=="")
  {
  document.getElementById("detailBox").innerHTML="";
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
	  //alert("ready");
    document.getElementById("detailBox").innerHTML=xmlhttp.responseText;
    }
  };
  if (document.getElementById("modeButton").value == "READ/update") {
	  //alert("Getting"); 
     xmlhttp.open("GET","http://localhost:9080/FootballPool/GetPlayerDetails.jsp?player="+str,true);
  }
  else {
	  
     //alert("Editing");
	 xmlhttp.open("GET","http://localhost:9080/FootballPool/EditPlayerDetails.jsp?player="+str,true);
  }	  
  xmlhttp.send();
}
</script>
</head>
<body>
<div style="color:#FF00FF" 	font-size:24px;>
<p id=para1>Players</p>

<table>
<tr>
<td>
<form action="Players.jsp" onsubmit="save()">
<select name="customers" onchange="showPlayers(this.value)">
<option value="">Select a player:</option>

<%
ArrayList<PoolPlayer> list;
PoolAccess pool = new PoolAccess();

list = pool.getPlayerList();
if (!list.isEmpty()) {
	for (int i=0;i<list.size();i++) {
		PoolPlayer p = list.get(i);
		System.out.println("player = " + p.getMoniker() + p.getId());
%>
<option value="<%=p.getId()%>"><%= p.getMoniker() %></option>
<%		 
	}
}
else {
	System.out.println("list is empty");
}
%>
</select>
</div>
</td>
<td>
<div font-size:16px; id="detailBox"></div>
</td>
</tr>
</table>
<p> </p>

<input name="modeButton" id="modeButton" value="READ/update" type="button" onclick="JavaScript:toggleModeButton()" />
<input name="submit" type="submit" value="Submit"/>
<input type="button" value="Done" onclick="JavaScript:window.close()" />
</form>
</body>
</html>
