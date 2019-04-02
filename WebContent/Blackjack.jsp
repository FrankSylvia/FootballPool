<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.fxs.Games.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>

	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Frank's Online Casino</title>
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/styles.css">
	<link href='https://fonts.googleapis.com/css?family=Oxygen:400,300,700' rel='stylesheet' type='text/css'>
	<link href='https://fonts.googleapis.com/css?family=Lora' rel='stylesheet' type='text/css'>
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
		integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">

	<script>

		var currentPlayerIndex = -1;
		var currentPlayerCommand = '';

		function command(playerIndex, playerCommand) {
			var xmlhttp;
			//alert("before " + currentPlayerIndex);

			if (currentPlayerIndex == -1) {
				currentPlayerIndex = playerIndex;
			}
			//alert("after " + currentPlayerIndex);

			currentPlayerCommand = playerCommand;

			var divName = "hand" + currentPlayerIndex;

			//alert(divName);
			//alert(currentPlayerCommand);


			if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
				xmlhttp = new XMLHttpRequest();
			}
			else {// code for IE6, IE5
				xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
			}
			xmlhttp.onreadystatechange = function () {
				if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
					//alert("ready");
					document.getElementById(divName).innerHTML = xmlhttp.responseText;
					var resp = xmlhttp.responseText;
					if ((currentPlayerCommand == 'stand') || (resp.indexOf("BUSTED") >= 0) || (resp.indexOf("21") >= 0)) {
						currentPlayerIndex = (parseInt(currentPlayerIndex, 10) + 1);
						//	    	alert("next " + currentPlayerIndex);
						if (currentPlayerIndex < 7) {
							divName = "hand" + currentPlayerIndex;
							currentPlayerCommand = 'next';
							var cmd = "http://localhost:9080/FootballPool/DealCardServlet?playerIndex=" + currentPlayerIndex + "&playerCommand=" + currentPlayerCommand;
							//	        	alert(cmd);
							xmlhttp.open("GET", cmd, true);
							xmlhttp.send();
						}
						else {
							alert("showResults");
							showResults();
						}
					}
				}
			};
			var cmd = "http://localhost:9080/FootballPool/DealCardServlet?playerIndex=" + currentPlayerIndex + "&playerCommand=" + currentPlayerCommand;
			//  alert(cmd);
			xmlhttp.open("GET", cmd, true);
			xmlhttp.send();

		}
		function showResults() {
			var xmlhttp;
			var divName = "results";

			if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
				xmlhttp = new XMLHttpRequest();
			}
			else {// code for IE6, IE5
				xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
			}
			xmlhttp.onreadystatechange = function () {
				if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
					//alert("ready");
					document.getElementById(divName).innerHTML = xmlhttp.responseText;
				}
			};

			xmlhttp.open("GET", "http://localhost:9080/FootballPool/BlackjackResultsServlet", true);
			xmlhttp.send();

		}
	</script>
<% 


Blackjack game = (Blackjack) session.getServletContext().getAttribute("gameName");

game.deal();
int currentPlayer = 1;
int highHand = 0;
String winningPlayer = "";
String pushPlayer = "";
String losingPlayer = "";
String cIndex="";
String pIndex="";
String handDivName = "";
String seatDivName = "";
int seatingRow1[] = { 2,3,4,5 };
int seatingRow2[] = { 1,6 };
int seatingRow3[] = { 0,7 };
int seatingRow4[] = { 8 };

%>
	<title>Blackjack Version: <%= game.getVersion()%></title>

</head>

<body>

<div class="text-center">
<h2> Blackjack</h2>
</div>
<div id="mytable" class="container thetable">
<%
System.out.println("PlayerCount =  " + game.getPlayerCount());
boolean foundStart=false;
int dealerValue = game.getHand(game.getPlayerCount()-1).computeHandValue();
System.out.println("Dealer has " + dealerValue);

for (int x=0;x<game.getPlayerCount();x++) { 
	BlackjackHand h = game.getHand(x);
	seatDivName	= "seat" + String.valueOf(x);
	handDivName	= "hand" + String.valueOf(x);
%>
	<div class="row mb-2">
		<div class="col-2  pl-5 pull-left">
			<%= game.getPlayerName(x) %>
		</div>
	</div>
	<div class="row mb-10" id="<%= handDivName %>">

<%
	int hitIndex= -1;
	for(int c=0;c<6;c++) {
		if (h.getCard(c) != null) {
			String imageName = "images/" + h.getCard(c).getImageName() + ".gif";
//			System.out.println(imageName);
			String divID = String.valueOf(x) + "^" + String.valueOf(c);
%>
			<div class="col col-1 pull-left">
				<img border="0" src="<%= imageName %>" width="49" height="66">
			</div>
		<%
		}
		else {
			if (hitIndex == -1) {
				hitIndex = c;
			}
		}
	}
	//tbd loop to find first non 21
	//if (x < game.getPlayerCount()-1) {
	if ((h.computeHandValue() != 21) && !foundStart && (dealerValue != 21)) {
		foundStart = true;
%>
		<div class="col col-1 mr-2 pull-left"><input class="btn btn-primary" type="button" value="Hit" onclick="command('<%= x %>','hit')" /></div>
		<div class="col col-1 mr-2 pull-left"><input class="btn btn-danger" type="button" value="Stand" onclick="command('<%= x %>','stand')" /></div>
<% 	
	}
%>
	</div>
<% 
}
//game = (Blackjack) session.getServletContext().getAttribute("gameName");
if (dealerValue == 21) {
	for (int x=0;x<game.getPlayerCount();x++) { 
		BlackjackHand h = game.getHand(x);
		if (h.getValue() > 21) {
			losingPlayer = losingPlayer + h.getPlayerName() + " ";
		}
		else if (h.getValue() < dealerValue && (x < game.getPlayerCount()-1)) {
			losingPlayer = losingPlayer + h.getPlayerName() + " ";
		}
		else if (h.getValue() > dealerValue && (x < game.getPlayerCount()-1)) {
			winningPlayer = winningPlayer + h.getPlayerName() + " ";
		}
		else if (h.getValue() == dealerValue && (x < game.getPlayerCount()-1)) {
			pushPlayer = pushPlayer + h.getPlayerName() + " ";
		}
	}
%>
</div>

	<div id="results">
		<p>Dealer Wins!!!</p>
	</div>
	<%
}
else {
%>
	<div id="results">
		<p>Play On</p>
	</div>
	<%
}
%>
</body>

</html>