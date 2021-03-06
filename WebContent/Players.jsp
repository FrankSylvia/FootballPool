<% System.out.println("Get list of player"); %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.fxs.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
  <!--<link rel="stylesheet" type="text/css" href="poolstyle.css">-->
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>People</title>
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <link rel="stylesheet" href="css/styles.css">
  <link rel="stylesheet" type="text/css" href="css/players_styles.css">
  <link href='https://fonts.googleapis.com/css?family=Oxygen:400,300,700' rel='stylesheet' type='text/css'>
  <link href='https://fonts.googleapis.com/css?family=Lora' rel='stylesheet' type='text/css'>
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
    integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">

  <script>

    function save() {
      //alert("Save");
    }
    function showPlayers(str) {
      var xmlhttp;
      if (str == "") {
        document.getElementById("detailBox").innerHTML = "";
        return;
      }
      if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
        xmlhttp = new XMLHttpRequest();
      }
      else {// code for IE6, IE5
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
      }
      xmlhttp.onreadystatechange = function () {
        if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
          //alert("ready");
          document.getElementById("detailBox").innerHTML = xmlhttp.responseText;
        }
      };
      //alert("Editing");
      xmlhttp.open("GET", "http://localhost:9080/FootballPool/EditPlayerDetails.jsp?player=" + str, true);

      xmlhttp.send();
    }

  </script>
</head>

<body>
  <div>
    <h2 id=para1 class="text-center">Players</h2>
  </div>
  <div class="container-fluid">
    <div class="row">
      <div class="col-4 playerlistdiv pull-left">
        <select class="selectpicker playerlist" size="16" name="customers" title="Select a player" autofocus=true onchange="showPlayers(this.value)" onloadeddata="showPlayers('')">
            <option class="playeroption" value="" >Select a player</option>

<%
System.out.println("Get list of player v1");
ArrayList<PoolPlayer> list;
PoolAccess pool = new PoolAccess();
list = pool.getPlayerList();
if (!list.isEmpty()) {
	for (int i=0;i<list.size();i++) {
		PoolPlayer p = list.get(i);
		System.out.println("player = " + p.getMoniker() + p.getId());
		System.out.println("agent = " + p.getAgentId());
%>
          <option class="playeroption" value="<%=p.getId()%>"><%= p.getMoniker() %></option>
<%		 
  }
}
else {
	System.out.println("list is empty");
}
%>
        </select>
      </div> <!-- col-4 -->

      <div class="col-8 pull-left" id="detailBox">
      </div>
    </div> <!-- row -->

      <div class="form-group row playerlistbuttons">
        <div class="offset-sm-2 col-sm-2 pull-left">
          <button name="Close" class="btn btn-primary" onclick="window.close()">Done</button>
        </div>
      </div>
</div> <!-- container-->
</body>
</html>