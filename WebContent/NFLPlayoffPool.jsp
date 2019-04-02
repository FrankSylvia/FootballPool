<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<style>
.bannertext
{
text-align:center;
}
.hdr
{
height:20px;text-align:center;background-color:Cyan;width:130px;
}
.afcbox
{
height:150px;width:130px;border-style:solid;background-color:#ff0080;border-color:Blue;border-width:medium;
}
.nfcbox
{
height:150px;width:130px;border-style:solid;background-color:#8080ff;border-color:Blue;border-width:medium;
}
</style>
<title>NFL Playoff Pool</title>
<script>



function checkAFCWildCard(cb)
{
	var picks = 0;
	var wc=0;
	var dp=0;
	var x = new Array;
	var y = new Array;
	var z = new Array;

	wc=0;
	x[wc++] = document.getElementById("WCAFC1");
	x[wc++] = document.getElementById("WCAFC2");
	x[wc++] = document.getElementById("WCAFC3");
	x[wc]   = document.getElementById("WCAFC4");
	
	y[0] = document.getElementById("DPAFC3Label");
	y[1] = document.getElementById("DPAFC4Label");

	z[0] = document.getElementById("DPAFC3");
	z[1] = document.getElementById("DPAFC4");

	for (wc=0;wc<4;wc++) {
		if (x[wc].checked) {
			picks = picks + 1;
		};
	}
	if (picks > 2) {
		alert("Please pick only 2 teams");
		cb.checked = false;
	}
	else {
		if (picks == 2) {
			wc=0;
			for (dp=0;dp < 2;) {
				for (;wc<4;wc++) {
					if (x[wc].checked) {
						y[dp].innerHTML = x[wc].value;
						z[dp].value = x[wc].value;
						wc = wc + 1;
						dp = dp + 1;
						break;
					};
				}
			}

		}
		else {
			for (dp=0;dp < 2;dp++) {
				y[dp].innerHTML = "tbd";
			}
		}
	}
}

function checkNFCWildCard(cb)
{
	var picks = 0;
	var wc=0;
	var dp=0;
	var x = new Array;
	var y = new Array;
	var z = new Array;

	wc=0;
	x[wc++] = document.getElementById("WCNFC1");
	x[wc++] = document.getElementById("WCNFC2");
	x[wc++] = document.getElementById("WCNFC3");
	x[wc]   = document.getElementById("WCNFC4");
	
	y[0] = document.getElementById("DPNFC3Label");
	y[1] = document.getElementById("DPNFC4Label");

	z[0] = document.getElementById("DPNFC3");
	z[1] = document.getElementById("DPNFC4");
	
	for (wc=0;wc<4;wc++) {
		if (x[wc].checked) {
			picks = picks + 1;
		};
	}
	if (picks > 2) {
		alert("Please pick only 2 teams");
		cb.checked = false;
	}
	else {
		if (picks == 2) {
			wc=0;
			for (dp=0;dp < 2;) {
				for (;wc<4;wc++) {
					if (x[wc].checked) {
						y[dp].innerHTML = x[wc].value;
						z[dp].value = x[wc].value;
						wc = wc + 1;
						dp = dp + 1;
						break;
					};
				}
			}

		}
		else {
			for (dp=0;dp < 2;dp++) {
				y[dp].innerHTML = "tbd";
			};
		}
	}
}

function checkAFCDP(cb)
{
	var picks = 0;
	var wc=0;
	var dp=0;
	var x = new Array;
	var y = new Array;
	var z = new Array;

	if (cb.value == "tbd") {
		alert("Invalid Choice");
		cb.checked = false;
	}
		
	wc=0;
	x[wc++] = document.getElementById("DPAFC1");
	x[wc++] = document.getElementById("DPAFC2");
	x[wc++] = document.getElementById("DPAFC3");
	x[wc]   = document.getElementById("DPAFC4");
	
	y[0] = document.getElementById("DCAFC1Label");
	y[1] = document.getElementById("DCAFC2Label");

	z[0] = document.getElementById("DCAFC1");
	z[1] = document.getElementById("DCAFC2");
	
	for (wc=0;wc<4;wc++) {
		if (x[wc].checked) {
			picks = picks + 1;
		};
	}
	if (picks > 2) {
		alert("Please pick only 2 teams");
		cb.checked = false;
	}
	else {
		if (picks == 2) {
			wc=0;
			for (dp=0;dp < 2;) {
				for (;wc<4;wc++) {
					if (x[wc].checked) {
						y[dp].innerHTML = x[wc].value;
						z[dp].value = x[wc].value;
						wc = wc + 1;
						dp = dp + 1;
						break;
					};
				}
			}

		}
		else {
			for (dp=0;dp < 2;dp++) {
				y[dp].innerHTML = "tbd";
			}
		}
	}	
}

function checkNFCDP(cb)
{
	var picks = 0;
	var wc=0;
	var dp=0;
	var x = new Array;
	var y = new Array;
	var z = new Array;

	if (cb.value == "tbd") {
		alert("Invalid Choice");
		cb.checked = false;
	}
		
	wc=0;
	x[wc++] = document.getElementById("DPNFC1");
	x[wc++] = document.getElementById("DPNFC2");
	x[wc++] = document.getElementById("DPNFC3");
	x[wc]   = document.getElementById("DPNFC4");
	
	y[0] = document.getElementById("DCNFC1Label");
	y[1] = document.getElementById("DCNFC2Label");

	z[0] = document.getElementById("DCNFC1");
	z[1] = document.getElementById("DCNFC2");

	for (wc=0;wc<4;wc++) {
		if (x[wc].checked) {
			picks = picks + 1;
		};
	}
	if (picks > 2) {
		alert("Please pick only 2 teams");
		cb.checked = false;
	}
	else {
		if (picks == 2) {
			wc=0;
			for (dp=0;dp < 2;) {
				for (;wc<4;wc++) {
					if (x[wc].checked) {
						y[dp].innerHTML = x[wc].value;
						z[dp].value = x[wc].value;
						wc = wc + 1;
						dp = dp + 1;
						break;
					};
				}
			}

		}
		else {
			for (dp=0;dp < 2;dp++) {
				y[dp].innerHTML = "tbd";
			}
		}
	};
}

function checkAFCDC(cb)
{
	var picks = 0;
	var wc=0;
	var dp=0;
	var x = new Array;
	var y = new Array;
	var z = new Array;

	if (cb.value == "tbd") {
		alert("Invalid Choice");
		cb.checked = false;
	}
		
	wc=0;
	x[wc++] = document.getElementById("DCAFC1");
	x[wc]   = document.getElementById("DCAFC2");
	
	y[0] = document.getElementById("SBAFCLabel");

	z[0] = document.getElementById("SBAFC");

	for (wc=0;wc<2;wc++) {
		if (x[wc].checked) {
			picks = picks + 1;
		};
	}
	if (picks > 1) {
		alert("Please pick only 1 team");
		cb.checked = false;
	}
	else {
		if (picks == 1) {
			wc=0;
			for (dp=0;dp < 1;) {
				for (;wc<2;wc++) {
					if (x[wc].checked) {
						y[dp].innerHTML = x[wc].value;
						z[dp].value = x[wc].value;
						wc = wc + 1;
						dp = dp + 1;
						break;
					};
				}
			}

		}
		else {
			for (dp=0;dp < 1;dp++) {
				y[dp].innerHTML = "tbd";
			}
		}
	}	
}


function checkNFCDC(cb)
{
	var picks = 0;
	var wc=0;
	var dp=0;
	var x = new Array;
	var y = new Array;
	var z = new Array;

	if (cb.value == "tbd") {
		alert("Invalid Choice");
		cb.checked = false;
	}
		
	wc=0;
	x[wc++] = document.getElementById("DCNFC1");
	x[wc]   = document.getElementById("DCNFC2");
	
	y[0] = document.getElementById("SBNFCLabel");

	z[0] = document.getElementById("SBNFC");

	for (wc=0;wc<2;wc++) {
		if (x[wc].checked) {
			picks = picks + 1;
		};
	}
	if (picks > 1) {
		alert("Please pick only 1 team");
		cb.checked = false;
	}
	else {
		if (picks == 1) {
			wc=0;
			for (dp=0;dp < 1;) {
				for (;wc<2;wc++) {
					if (x[wc].checked) {
						y[dp].innerHTML = x[wc].value;
						z[dp].value = x[wc].value;
						wc = wc + 1;
						dp = dp + 1;
						break;
					};
				}
			}

		}
		else {
			for (dp=0;dp < 1;dp++) {
				y[dp].innerHTML = "tbd";
			}
		}
	}
}

function checkSB(cb)
{
	var picks = 0;
	var wc=0;
	var dp=0;
	var x = new Array;
	var y = new Array;

	if (cb.value == "tbd") {
		alert("Invalid Choice");
		cb.checked = false;
	}
		
	wc=0;
	x[wc++] = document.getElementById("SBAFC");
	x[wc]   = document.getElementById("SBNFC");
	
	y[0] = document.getElementById("SBWINNER");

	for (wc=0;wc<2;wc++) {
		if (x[wc].checked) {
			picks = picks + 1;
		}
	}
	if (picks > 1) {
		alert("Please pick only 1 team");
		cb.checked = false;
	}
	else {
		if (picks == 1) {
			wc=0;
			for (dp=0;dp < 1;) {
				for (;wc<2;wc++) {
					if (x[wc].checked) {
						y[dp].innerHTML = x[wc].value;
						wc = wc + 1;
						dp = dp + 1;
						break;
					};
				}
			}

		}
		else {
			for (dp=0;dp < 1;dp++) {
				y[dp].innerHTML = " ";
			}
		}
	}
}
/*
function checkSubmit() {

	var index = 0;
	var x = new Array;
	boolean result = true;
	alert("submitted");
	x[index++] = document.getElementById("SBAFC");
	x[index++] = document.getElementById("SBNFC");
	x[index]   = document.getElementById("SBWINNER");

	for (index = 0;index < 3;index++) {
		if (!x[index].checked) {
			result = false;
			alert("Some picks not completed");
			break;
		};
	}
	return result;
}
*/

</script>

</head>
<body>
<form onSubmit="return checkSubmit()" >
<table style="height:300px;width:650px;">
<tr>
<td>
<span id="ContestantLabel" style = "text-align:right;">Contestant: </span>
</td>
<td>
  <input type="text" id="CONTESTANT" Value=" " style="BACKGROUND-COLOR: #c0c0c0; width : 131px;">
</td>
</tr>
<tr>
<td class="hdr">
Wild Card
</td>
<td class="hdr">
Divisional Playoff
</td>
<td class="hdr">
Conference Championship
</td>
<td class="hdr">
Super Bowl
</td>
<td class="hdr">
Tie Breaker
</td>
</tr>
<tr>
<th style="height:20px;font-style:italic;width:130px;background-color:White;">
*Pick 2 Winners
</th>
<th style="height:20px;font-style:italic;width:130px;background-color:White;">
*Pick 2 Winners
</th>
<th style="height:20px;font-style:italic;width:130px;background-color:White;">
*Pick 1 Winner
</th>
<th style="height:20px;font-style:italic;width:130px;background-color:White;">
*Pick Winner
</th>
<th style="height:20px;font-style:italic;width:130px;background-color:White;">
*SuperBowl Points
</th>

</tr><tr >
<td>
</td>
<td>
</td>
<td style="height:20px;text-align:center;width:130px;background-color: #ff8000;">
<span>AFC</span>
</td>
<td>
</td>
<td>
</td>
</tr>
<tr style=" height : 50px;">
<td style=" width : 130px;">
<table class="afcbox">
<tr>
<td>
<input type="checkbox" id="WCAFC1" Value="Jets" onclick="checkAFCWildCard(this)"><span id="WCAFC1Label" >Jets</span><br>
<input type="checkbox" id="WCAFC2" Value="Colts" onclick="checkAFCWildCard(this)"><span id="WCAFC2Label" >Colts</span><br>
<input type="checkbox" id="WCAFC3" Value="Ravens" onclick="checkAFCWildCard(this)"><span id="WCAFC3Label" >Ravens</span><br>
<input type="checkbox" id="WCAFC4" Value="Seahawks" onclick="checkAFCWildCard(this)"><span id="WCAFC4Label" >Seahawks</span><br>
 </td>
</tr>
</table>
</td>
<td style=" width : 130px;">
<table class="afcbox">
<tr>
<td>
<input type="checkbox" id="DPAFC1" Value="Patriots" onclick="checkAFCDP(this)"><span id="DPAFC1Label">Patriots</span><br>
<input type="checkbox" id="DPAFC2" Value="Broncos" onclick="checkAFCDP(this)"><span id="DPAFC2Label" >Broncos</span><br>
<input type="checkbox" id="DPAFC3" Value="tbd" onclick="checkAFCDP(this)"><span id="DPAFC3Label" >tbd</span><br>
<input type="checkbox" id="DPAFC4" Value="tbd" onclick="checkAFCDP(this)"><span id="DPAFC4Label" >tbd</span><br>
</td>
</tr>
</table>
</td>
<td style=" width : 130px;">
<table class="afcbox">
<tr>
<td>
<input type="checkbox" id="DCAFC1" Value="tbd" onclick="checkAFCDC(this)"><span id="DCAFC1Label" >tbd</span><br>
<input type="checkbox" id="DCAFC2" Value="tbd" onclick="checkAFCDC(this)"><span id="DCAFC2Label" >tbd</span><br>
</td>
</tr>
</table>
</td>
<td style=" width : 130px;">
<table class="afcbox">
<tr>
<td>
<input type="checkbox" id="SBAFC" Value="tbd" onclick="checkSB(this)"><span id="SBAFCLabel" >tbd</span><br>
</td>
</tr>
</table>
</td>
<td style=" width : 130px;">
<table class="afcbox">
<tr>
<td>
<input type="text" id="AFCSCORE" Value=" " onclick="checkAFCSCORE(this)" style="BACKGROUND-COLOR: #c0c0c0; width:40px;"><br>
</td>
</tr>
</table>
<tr>
<td>
</td>
<td>
</td>
<td style="height:20px;text-align:center;width:130px;background-color: #ff8000;">
<span>NFC</span>
</td>
<td>
</td>
<td>
<span id="SBWINNER" style="width:130px;background-color: #00ff00;">Superbowl Winner</span>
</td>
</tr>

<tr style=" height : 50px;">
<td style=" width : 130px;">
<table class="nfcbox">
<tr>
<td>
<input type="checkbox" id="WCNFC1" Value="Cowboys" onclick="checkNFCWildCard(this)"><span id="WCNFC1Label" >Cowboys</span><br>
<input type="checkbox" id="WCNFC2" Value="49ers" onclick="checkNFCWildCard(this)"><span id="WCNFC2Label" >49ers</span><br>
<input type="checkbox" id="WCNFC3" Value="Packers" onclick="checkNFCWildCard(this)"><span id="WCNFC3Label" >Packers</span><br>
<input type="checkbox" id="WCNFC4" Value="Panthers" onclick="checkNFCWildCard(this)"><span id="WCNFC4Label" >Panthers</span><br>
</td>
</tr>
</table>
</td>
<td style=" width : 130px;">
<table class="nfcbox">
<tr>
<td>
<input type="checkbox" id="DPNFC1" Value="Hawks" onclick="checkNFCDP(this)"><span id="DPNFC1Label" >Hawks</span><br>
<input type="checkbox" id="DPNFC2" Value="Vikings" onclick="checkNFCDP(this)"><span id="DPNFC2Label" >Vikings</span><br>
<input type="checkbox" id="DPNFC3" Value="tbd" onclick="checkNFCDP(this)"><span id="DPNFC3Label" >tbd</span><br>
<input type="checkbox" id="DPNFC4" Value="tbd" onclick="checkNFCDP(this)"><span id="DPNFC4Label" >tbd</span><br>
</td>
</tr>
</table>
</td>
<td style=" width : 130px;">
<table class="nfcbox">
<tr>
<td>
<input type="checkbox" id="DCNFC1" Value="tbd" onclick="checkNFCDC(this)"><span id="DCNFC1Label" >tbd</span><br>
<input type="checkbox" id="DCNFC2" Value="tbd" onclick="checkNFCDC(this)"><span id="DCNFC2Label" >tbd</span><br>
</td>
</tr>
</table>
</td>
<td style=" width : 130px;">
<table class="nfcbox">
<tr>
<td>
<input type="checkbox" id="SBNFC" Value="tbd" onclick="checkSB(this)"><span id="SBNFCLabel" >tbd</span><br>
</td>
</tr>
</table>
</td>
<td style=" width : 130px;">
<table class="nfcbox">
<tr>
<td>
<input type="text" id="NFCSCORE" Value=" " onclick="checkNFCSCORE(this)" style="BACKGROUND-COLOR: #c0c0c0; width:40px;"><br>
</td>
</tr>
</table>
</td>
</tr>
</table>
<table>
<tr>
<td>
<input name="submit" type="submit" value="Submit" />
</td>
</tr>
</table>
</form>
</body>
</html>