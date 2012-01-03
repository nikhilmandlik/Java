<!-- 
* Class Name                     : InvoiceReportM&C.jsp
* Description                    : generates Invoice Report
* Author 						 : Nikhil Mandlik
*/
 -->
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import = "javax.sql.rowset.CachedRowSet" %>
<%@ page import = "com.sun.rowset.CachedRowSetImpl" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
     <title>Invoice Report</title>
     <link rel="stylesheet" type="text/css" href="commonstyle.css">
    
     <script language="Javascript" src="ReportDate.js" ></script>
	
</head>
<body>
<% 

if(((String)session.getAttribute("user")==null) || 
((String)session.getAttribute("sessionDesignation")==null))
{%>
<%-- Sending the control on error page if --%>

<jsp:forward page="errorPage.jsp">
<jsp:param name="error" value="Your Session has expired, Please Relogin!!!"/>
</jsp:forward>		
<%
}
%>
<%	
	CachedRowSet cachedRowSet=null;
%>
	
			<div class="heading3" align="right">
			<A Href="HomePage.jsp">Home</A>
			<A Href="Logout.jsp">Logout</A>
			</div>

	<!--Form used to make GUI-->
	<form name="ReportForm" action="InvoiceReport.jsp">
		<h1 class="heading1" align="center">Sterling Courier</h1>
	
		<table align="center" width="500" height="200"><br><br>
			<tr>
				<th align="center" colspan="3" class="heading3">Invoice Report
				</th>
			</tr>
		
			<tr>
				<td Width="30%">
					<!--Defining Remarks field-->
					Customer ID
					<span class="mandatory">*</span>
				</td>
				<td>
				</td>
				<td >
					<jsp:useBean id="sterlingDAO" class="package_SterlingDAO.SterlingDAO">
								<%
								  cachedRowSet=sterlingDAO.invoiceReportCustomerID();
								%>
					</jsp:useBean>	
					<select name="customerid">
		<%		
						while(cachedRowSet.next()){
		%>						
							<option  value="<%=cachedRowSet.getInt(1)%>"><%=cachedRowSet.getInt(1)%></option>						
		<%  			}			
		%>
					</select>
				</td>
			</tr>
		
			<tr>
				<td Width="10%">
					<!--Defining Remarks field-->
					Duration
					<span class="mandatory">*</span>
				</td>		
				
				<td Width="10%">
					From
				</td>		
						
				<td>	
					<select name="fromday" >
						<% 	int i=0;
							for (i=1;i<32;i++){
						%>
							<option value="<%=i%>"><%=i%></option>
						<%	}		
						%>
					</select>
				
						<select name="frommonth">
							<option value="Jan" selected>Jan</option>
							<option value="Feb">Feb</option>
							<option value="Mar">Mar</option>
							<option value="Apr">Apr</option>
							<option value="May">May</option>
							<option value="Jun">Jun</option>
							<option value="Jul">Jul</option>
							<option value="Aug">Aug</option>
							<option value="Sep">Sep</option>
							<option value="Oct">Oct</option>
							<option value="Nov">Nov</option>
							<option value="Dec">Dec</option>
						</select>
				
						<select name="fromyear" >
							<% 	for (i=1985;i<2060;i++){
							%>
								<option value="<%=i%>"><%=i%></option>
							<%	}		
							%>
						</select>
				</td>
						
			</tr>
			
				<tr>	
					<td>
					</td>
					<td>
						To
					</td>
						<td>	
					<select name="today" >
						<% 	 i=0;
							for (i=1;i<32;i++){
						%>
							<option value="<%=i%>"><%=i%></option>
						<%	}		
						%>
					</select>
				
						<select name="tomonth">
							<option value="Jan" selected>Jan</option>
							<option value="Feb">Feb</option>
							<option value="Mar">Mar</option>
							<option value="Apr">Apr</option>
							<option value="May">May</option>
							<option value="Jun">Jun</option>
							<option value="Jul">Jul</option>
							<option value="Aug">Aug</option>
							<option value="Sep">Sep</option>
							<option value="Oct">Oct</option>
							<option value="Nov">Nov</option>
							<option value="Dec">Dec</option>
						</select>
				
						<select name="toyear" >
							<% 	for (i=1985;i<2060;i++){
							%>
								<option value="<%=i%>"><%=i%></option>
							<%	}		
							%>
						</select>
				</td>
			</tr>		
		
			<tr align="center">
				<td colspan="3">
					<H6><br>Fields marked with asterisk
					<span class="mandatory">(*)</span> are compulsory.
					<br>This information is a must for successful Invoice Report Generation</H6>
				</td>
			</tr>
		
			<tr>
				<td colspan="3" align="center">
					<!--Submit and Reset controls and validating the Delivery Date and Status-->
					<input name="InvoiceReportSubmit" type="submit" value="Submit" onClick="return validation()">
					<input type="reset" value="Reset">
				</td>
			</tr>
		</table>
	
	</form>

</body>
</html>

<!-- End of file -->