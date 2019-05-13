<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.fxs.util.*" %>
<%@ page import="java.util.ResourceBundle"%>
<%
	ResourceBundle rb = ResourceBundle.getBundle("Casino");
    System.out.println("querystring= " + request.getQueryString());
	Person pp = null;
	PoolAccess pool = new PoolAccess();

	//pp = pool.getPersonDetails(Integer.valueOf(request.getParameter("player")));

%>    
<div class="col-md-3 col-sm-6 col-xs-12v game-tile">
    <a href="/FootballPool/CardGameServlet?Game=Blackjack">
      <div id="blackjack-tile"><span><%= rb.getString("blackjack")%></span></div>
    </a>
  </div>
  <div class="col-md-3 col-sm-6 col-xs-12 game-tile">
    <a href="http://localhost:9080/FootballPool/CardGameServlet?Game=Poker">
      <div id="poker-tile"><span><%= rb.getString("poker")%></span></div>
    </a>
  </div>
  <div class="col-md-3 col-sm-6 col-xs-12 game-tile">
    <a href="http://localhost:9080/FootballPool/NFLPlayoffPool.jsp">
      <div id="pool-tile"><span><%= rb.getString("football_pool")%></span></div>
    </a>
  </div>
  <div class="col-md-3 col-sm-6 col-xs-12 game-tile">
    <a href="bingo.html">
      <div id="bingo-tile"><span><%= rb.getString("bingo")%></span></div>
    </a>
  </div>
  <div class="col-md-3 col-sm-6 col-xs-12 game-tile">
    <a href="keno.html">
      <div id="keno-tile"><span><%= rb.getString("keno")%></span></div>
    </a>
  </div>
<%
System.out.println("Exiting GetHomeTiles");
%>