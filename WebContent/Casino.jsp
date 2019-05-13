<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.util.ResourceBundle"%>
    
<% 
System.out.println("querystring= " + request.getQueryString());
session = request.getSession();
ResourceBundle rb = ResourceBundle.getBundle("Casino");

%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title><%= rb.getString("title")%></title>
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <link rel="stylesheet" href="css/styles.css">
  <link href='https://fonts.googleapis.com/css?family=Oxygen:400,300,700' rel='stylesheet' type='text/css'>
  <link href='https://fonts.googleapis.com/css?family=Lora' rel='stylesheet' type='text/css'>
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
    integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">


</head>
<body>
    <header>
      <nav id="header-nav" class="navbar navbar-default">
        <div class="container">
          <div class="navbar-header">
            <a href="index.html" class="pull-left visible-md visible-lg">
              <div id="logo-img"></div>
            </a>

            <div class="navbar-brand">
              <a href="index.html">
                <h1><%= rb.getString("title")%></h1>
              </a>
              <p>
                <span><%= rb.getString("slogan")%></span>
              </p>
            </div>

            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#collapsable-nav"
              aria-expanded="false">
              <span class="sr-only">Toggle navigation</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
          </div>

          <div id="collapsable-nav" class="collapse navbar-collapse">
            <ul id="nav-list" class="nav navbar-nav navbar-right">
              <li>
                <a href="Players.jsp">
                  <span class=" glyphicon glyphicon-user"></span><br class="hidden-xs"><%= rb.getString("players")%> </a>
              </li>
              <li>
                <a href="menu-categories.html">
                  <span class="glyphicon glyphicon-knight"></span><br class="hidden-xs"><%= rb.getString("games")%> </a>
              </li>
              <li>
                <a href="#">
                  <span class="glyphicon glyphicon-piggy-bank"></span><br class="hidden-xs"><%= rb.getString("teller")%> </a>
              </li>
              <li>
                <a href="#">
                  <span class="glyphicon glyphicon-info-sign"></span><br class="hidden-xs"><%= rb.getString("about")%> </a>
              </li>
              <li>
                <a id="loginButton">
                  <span class="glyphicon glyphicon-log-in" id="loginButton"></span><br class="hidden-xs"><%= rb.getString("sign_in")%> </a>
              </li>
            </ul><!-- #nav-list -->
          </div><!-- .collapse .navbar-collapse -->
        </div><!-- .container -->
      </nav><!-- #header-nav -->
    </header>
    <div id="loginModal" class="modal fade" role="dialog">
      <div class="modal-dialog modal-lg" role="content">
        <!-- Modal content-->
        <div class="modal-content">
          <div class="modal-header">
            <h4 class="modal-title"><%= rb.getString("sign_in")%></h4>
            <button type="button" class="close btn-danger" data-dismiss="modal">&times;</button>
          </div>
          <div class="modal-body">
            <form>
              <div class="form-row">
                <div class="form-group col-sm-4">
                  <label class="sr-only" for="inputEmail"><%= rb.getString("email_address")%></label>
                  <input type="text" class="form-control form-control-sm mr-1" id="inputEmail"
                    placeholder="Enter email">
                </div>
                <div class="form-group col-sm-4">
                  <label class="sr-only" for="inputPassword"><%= rb.getString("password")%></label>
                  <input type="text" class="form-control form-control-sm mr-1" id="inputPassword"
                    placeholder="Password">
                </div>
                <div class="col-sm-auto">
                  <div class="form-check">
                    <input class="form-check-input" type="checkbox">
                    <label class="form-check-label"><%= rb.getString("remember_me")%>
                    </label>
                  </div>
                </div>
              </div>
              <div class="form-row">
                <div class="form-group col-sm-6">
                  <a>
                    <div type=text id="loginMsg"><span></span></div>
                  </a>
                  
                </div>
                <div class="form-group col-sm-6">
                  <a>
                    <div type=text id="loginMsg2"><span></span></div>
                  </a>
                </div>
              </div>
              <div class="form-row">
                <button type="button" class="btn btn-danger btn-sm ml-auto" data-dismiss="modal"><%= rb.getString("cancel")%></button>
                <button type="button" class="btn btn-primary btn-sm ml-1" onclick='loginRequest();close()'><%= rb.getString("sign_in")%></button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
    <div id="main-content" class="container">
      <div class="jumbotron">
        <img src="images/casino.jpg" alt="Picture of restaurant" class="img-responsive visible-xs">
      </div>
      <div id="home-tiles" class="row">
    </div>
    <footer class="footer">
      <div class="container">
        <div class="row">
          <div class="col-xs-12 text-center">
            <p class="glyphicon glyphicon-copyright-mark"><%= rb.getString("copyright")%> 2019 Frank Sylvia</p>
          </div>
        </div>
      </div>
    </footer>

    <!-- jQuery (Bootstrap JS plugins depend on it) -->
    <script src="js/jquery-2.1.4.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/script.js"></script>
    <script>
      $(document).ready(function () {
        $("#loginButton").click(function () {
          $('#loginModal').modal('toggle')
        });
      });
    </script>
    <script>
      function getHomeTiles() {

        var rsp = document.getElementById("loginMsg").innerHTML;          		
       	if(rsp.indexOf("Authorized") != -1) {
			return;
       	}
    	var email = document.getElementById("inputEmail");
        var txtEmail = email.value;
		
        var xmlhttp;
        if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
          xmlhttp = new XMLHttpRequest();
        }
        else {// code for IE6, IE5
          xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
        }
        xmlhttp.onreadystatechange = function () {
          if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
            //alert("ready");
            document.getElementById("home-tiles").innerHTML = xmlhttp.responseText;
          }
        };
        //alert("Editing");
        xmlhttp.open("GET", "/FootballPool/GetHomeTiles.jsp?email=" + txtEmail , true);
  
        xmlhttp.send();
      }
    function loginRequest() {
      var email = document.getElementById("inputEmail");
      var txtEmail = email.value;
      var pwd = document.getElementById("inputPassword");
      var txtPwd = pwd.value;

      var xmlhttp;
      if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
        xmlhttp = new XMLHttpRequest();
      }
      else {// code for IE6, IE5
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
      }
      xmlhttp.onreadystatechange = function () {
        if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
          //alert("ready");
	        var rsp = xmlhttp.responseText;
          	if(rsp.indexOf("123581321") > -1) {
          		getHomeTiles();
                $('#loginModal').modal('hide');        	  
			}
          	else {
                document.getElementById("loginMsg").innerHTML = xmlhttp.responseText;          		
          	}
        }
      };

      
      xmlhttp.open("GET", "/FootballPool/Login.jsp?email=" + txtEmail + "&pwd=" + txtPwd, true);

      xmlhttp.send();
    }    
    </script>

  </body>

</html>