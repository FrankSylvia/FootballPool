<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.fxs.Games.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<% 
Poker game = (Poker) session.getServletContext().getAttribute("gameName");

/*
Poker p = new Poker();
long seed = System.currentTimeMillis() % 100;
for (long t=0;t<seed;t++) {
	p.shuffle();
}
*/
game.deal();
int highHand = 0;
String winningPlayer = "";
%>
<title>Poker Version: <%= game.getVersion()%></title>
<style>
.heart
{
height:50px;width:30px;border-style:solid;background-color:white;border-color:blue;border-width:medium;
}
.spade
{
height:50px;width:30px;border-style:solid;background-color:white;border-color:blue;border-width:medium;
}
</style>

</head>
<body>
<TABLE >
<%
for (int x=0;x<7;x++) { 
	PokerHand h = game.getHand(x);
	if (h.getValue() >= highHand) {
		highHand = h.getValue();
		winningPlayer = h.getPlayerName();
	}
%>
<TR>
<TD><%= h.getPlayerName() %></TD>

<%
	for(int c=0;c<5;c++) {
		String imageName = "images/" + h.getCard(c).getImageName() + ".gif";
		System.out.println(imageName);
%>
		<TD><img border="0" src="<%= imageName %>" width="49" height="66"></TD>
<%
	}
%>
<TD><%= h.getValue()%></TD>
</TR>
<% } 
game = null;
%>
</TABLE>
<p>Winning Player is <%= winningPlayer %>
</body>
</html>