<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="fxs.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="poolstyle.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<title>Pool</title>
<script>
function dealCard(str)
{
var xmlhttp; 
alert("dealCard " + str )
if (str=="")
  {
  document.getElementById("discards").innerHTML="Hello World";
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
    document.getElementById("discards").innerHTML=xmlhttp.responseText;
    }
  };
 alert("Send")
  xmlhttp.open("GET","http://localhost:9080/FootballPool/DealCardServlet",true);
  xmlhttp.send();
}

function openit(str)
{
	var url = "";
	if (str == "") {
		alert("Select an item");
		document.getElementById(done).setFocus();
		return;
	}
	if (str == "Blackjack") {
		url = "http://localhost:9080/FootballPool/CardGameServlet?Game=Blackjack";
	}
	else {
		if (str == "Casino") {
			url = "http://localhost:9080/FootballPool/bootstrap.html";
		}
		else {
			if (str == "NFLPlayoffPool") {
				alert(str);
				url = "http://localhost:9080/FootballPool/" + str + ".jsp";
			}
			else {
				url = "http://localhost:9080/FootballPool/Players.jsp";
			}
		}
	}
	
	window.open(url,str);
	document.getElementById(done).setFocus();
}
function start()
{
document.getElementById(topmenu).value="Blackjack";
}
</script>

</head>
<body>
<p id=para1>Welcome to the Pool</p>
<div>
Select something:
<form  action=""> 
<select style="color:DodgerBlue;background-color:#d0e4fe" size="3" name="topmenu" onfocus="start()" onclick="openit(this.value)">
<option style="color:DodgerBlue;background-color:#d0e4fe" value="Blackjack">Blackjack</option>
<option style="color:DodgerBlue;background-color:#d0e4fe" value="Casino">Casino</option>
<option style="color:DodgerBlue;background-color:#d0e4fe" value="NFLPlayoffPool">NFL Pool</option>
<option style="color:DodgerBlue;background-color:#d0e4fe" value="Agent">Agent Business</option>
<option style="color:DodgerBlue;background-color:#d0e4fe" value="Players">Player List</option>
<option style="color:DodgerBlue;background-color:#d0e4fe" value="StockQuote">StockQuote</option>
<option style="color:DodgerBlue;background-color:#d0e4fe" value="Pong">Pong</option>
<option style="color:DodgerBlue;background-color:#d0e4fe" value="Pools">Pools</option>


</select>


</form>
</div>
<table>
<caption>Details</caption>    
<tr>
<td>
<div id="txtJunk">Junk</div>
</td>
<td>
<div id="txtStuff">Stuff</div>
</td>
</tr>
<tr>
<TD><input name="hit" type="button" value="Hit" onclick="dealCard('Queen')" /></TD>
<td>
<div id="discards"> <img border="0" src="images/kd.gif" width="49" height="66"></div>
</td>
</tr>
</table>
<input name="done" type="button" value="Done" onclick="JavaScript:window.close()" />
</body>
</html>
