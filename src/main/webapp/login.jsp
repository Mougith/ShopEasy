<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Login</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" href="css/changes.css">
<link rel="preconnect" href="https://fonts.gstatic.com">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;600&display=swap" rel="stylesheet">
    
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<!--Stylesheet-->
    <style media="screen">
      *,
*:before,
*:after{
    padding: 0;
    margin: 0;
    box-sizing: border-box;
}
body{
    background-color: #080710;
}
.background{
    width: 430px;
    height: 520px;
    position: absolute;
    transform: translate(-50%,-50%);
    left: 50%;
    top: 50%;
}
.background .shape{
    height: 150px;
    width: 150px;
    position: absolute;
    border-radius: 50%;
}
.shape:first-child{
    background: linear-gradient(
        #1845ad,
        #23a2f6
    );
    left: -80px;
    top: -80px;
}
.shape:last-child{
    background: linear-gradient(
        to right,
        #ff512f,
        #f09819
    );
    right: -30px;
    bottom: -80px;
}
#loginForm{
	margin-top: 50px;
    height: 519px;
    width: 400px;
    background-color: #FEBD6A;
    font-family: 'Lora', serif;
    position: absolute;
    transform: translate(-50%,-50%);
    top: 50%;
    left: 50%;
    border-radius: 10px;
    backdrop-filter: blur(10px);
    border: 2px solid rgba(255,255,255,0.1);
    box-shadow: 0 0 40px rgba(8,7,16,0.6);
    padding: 50px 35px;
}
#loginForm *{
    font-family: 'Poppins',sans-serif;
    color: #000000;
    letter-spacing: 0.5px;
    outline: none;
    border: none;
    width: 100%
}
#loginForm h3{
    font-size: 32px;
    font-weight: 500;
    line-height: 42px;
    text-align: center;
}

label{
    display: block;
    margin-top: 30px;
    font-size: 16px;
    font-weight: 500;
}
#loginForm input{
    display: block;
    height: 50px;
    width: 100%;
    background-color: rgba(255,255,255,0.07);
    border-radius: 3px;
    padding: 0 10px;
    margin-top: 8px;
    font-size: 14px;
    font-weight: 300;
}
::placeholder{
    color: #e5e5e5;
}
button{
    margin-top: 50px;
    width: 100%;
    background-color: #2ad82b;
    color: #080710;
    padding: 15px 0;
    font-size: 18px;
    font-weight: 600;
    border-radius: 5px;
    cursor: pointer;
}
.social{
  margin-top: 30px;
  display: flex;
}
.social div{
  background: red;
  width: 150px;
  border-radius: 3px;
  padding: 5px 10px 10px 5px;
  background-color: rgba(255,255,255,0.27);
  color: #eaf0fb;
  text-align: center;
}
.social div:hover{
  background-color: rgba(255,255,255,0.47);
}
.social .fb{
  margin-left: 25px;
}
.social i{
  margin-right: 4px;
}

    </style>
</head>
<body style="background-color: #E6F9E6;">

	<%@ include file="header.jsp"%>

	<%
	String message = request.getParameter("message");
	%>
    
    <form id="loginForm" action="./LoginSrv" method="post">
        <h3 style="font-family: 'Lora', serif;">Login Here</h3>
        <%
					if (message != null) {
					%>
					<p style="color: blue;">
						<%=message%>
					</p>
					<%
					}
					%>
        <label for="username" style="font-family: 'Lora', serif;">Username</label>
        <input style="font-family: 'Lora', serif; background-color: #e8f0fe;" type="email" placeholder="Enter Username" name="username" id="last_name" required>
        
		<label style="font-family: 'Lora', serif;" for="password">Password</label>
		<input style="font-family: 'Lora', serif; background-color: #e8f0fe;" type="password" placeholder="Enter Password" name="password" id="last_name" required>
        
       

		
		<div class="row" style="margin-left:0px; margin-right=0px;">
					<div class="col-md-12 form-group" style="width:50%;float:left;padding-left: 0px;">
						<label style="font-family: 'Lora', serif;" for="userrole">Login As</label> 
					</div>
					<div class="col-md-12 text-center" style="width:50%;float:right;margin-top: 20px;padding-right: 0px;">
						<select name="usertype" id="userrole" style="background: #fdffff94;" class="form-control" required="">
							<option value="customer" selected="">CUSTOMER</option>
							<option value="admin">ADMIN</option>
						</select>
					</div>
				</div>
				
		<div class="row" style="margin-left:0px; margin-right=0px;">
			<div class="col-md-12 text-center" style="width:50%;float:left;border-top-width: 0px;padding-right: 3px;padding-left: 0px;">
				<button type="submit" class="btn btn-success" style="color:white">Login</button>
			</div>
			<div class="col-md-12 text-center" style="width:50%;float:right;padding-left: 3px;padding-right: 0px;">
				<button type="reset" class="btn btn-danger"  style="color:white">Reset</button>
			</div>
		</div>
		
				

    </form>

</body>
</html>