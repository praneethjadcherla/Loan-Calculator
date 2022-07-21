<%@page import="Loanrepayment.Loancalculation"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<title>Loan Calculator</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	
<style>
table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
}
.center {
	margin-left: auto;
	margin-right: auto;
}
</style>

</head>
<body>
	<%
	float amount = Float.parseFloat(request.getParameter("amount"));
	float interestrate = Float.parseFloat(request.getParameter("interestrate"));
	float period = Float.parseFloat(request.getParameter("period"));
	%>

	<div class="jumbotron text-center">
		<h2>
			<b>Loan Calculator</b>
		</h2>
		<br>
	</div>
	
	<form action="PrintOutput.jsp" class="text-center" id="inputform" onsubmit="return validateForm()">
		<label for="amount">Loan Amount:</label>&nbsp;&nbsp;&nbsp;&nbsp; <input
			type="text" id="amount" name="amount"
			value=<%out.println((int) amount);%>><br>
		<br> <label for="interest">Annual Interest Rate:</label>&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="text" id="interest" name="interestrate"
			value=<%out.println((int) interestrate);%>><br>
		<br> <label for="period">Loan Period in Months:</label>&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="text" id="period" name="period"
			value=<%out.println((int) period);%>><br>
		<br> <br>
		<button>Submit</button>
	</form>
	
	<script>
  	function validateForm() {
  	var x = document.forms["inputform"]["amount"].value;
  	var y = document.forms["inputform"]["interestrate"].value;
  	var z = document.forms["inputform"]["period"].value;
  	
  	if (x == ""|| y==""|| z=="") {
    	alert("This field cannot be empty");
    	return false;
 		 }
  	if(isNaN(x)||isNaN(y)||isNaN(z)){
  		alert("Please enter a number..!!");
  		return false;
  	}
  	if(y>100){
  		alert("Interest Rate should be less than 100");
  		return false;	
  	} 	
  	}
  	</script>
	<br>
	
	<div class="text-center">
		<h3>
			<b>Loan Repayment Schedule</b>
		</h3>
		<br>
	</div>


	<div class="container">
		<table style="width: 80%" class="table table-striped center">
			<tr>
				<th>Payment No</th>
				<th>Payment Amount</th>
				<th>Principal Amount Paid</th>
				<th>Interest Amount Paid</th>
				<th>Loan Outstanding Balance</th>
			</tr>
			<%
			Loancalculation lc = new Loancalculation();
			for (int n = 1; n <= period; n++) {
				float Payment = lc.PaymentAmount(amount, interestrate, period);
				float PP = lc.PrincipleAmountPaid(interestrate, period, n);
				float Interest = lc.InterestAmountPaid();
				float Balance = lc.LoanOutstandingBalance(interestrate);
			%>

			<tr>
				<td>
					<%
					out.println(n);
					%>
				</td>
				<td>
					<%
					out.println(Payment);
					%>
				</td>
				<td>
					<%
					out.println(PP);
					%>
				</td>
				<td>
					<%
					out.println(Interest);
					%>
				</td>
				<td>
					<%out.println(Balance);%>
				</td>
			</tr>
			<%
			}
			%>

		</table>
	</div>
</body>
</html>