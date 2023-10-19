<%-- 
    Document   : register
    Created on : 24-Mar-2023, 6:21:38 pm
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New User</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <div class="container-fluid">
            <div class="row mt-5">
                <div class="col-md-4 offset-md-4">
                    <div class="card">
                        
                        <%@include file="components/message.jsp" %>
                        
                        <div class="card-body px-5">

                            <div class="container text-center">
                                <img src="img/register.png" style="max-width : 100px;" class="img-fluid">
                            </div>

                            <h3 class="text-center my-3">Sign up Here !!</h3>
                            <form action="RegisterServlet" metod="post">
                                <div class="form-group">
                                    <label for="name">User Name</label>
                                    <input name="user_name" type="text" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter Your Name">
                                    <!--<small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>-->
                                </div>
                                <div class="form-group">
                                    <label for="email">User Email</label>
                                    <input name="user_email" type="email" class="form-control" id="email" aria-describedby="emailHelp" placeholder="Enter Your Eamil-Id">
                                    <!--<small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>-->
                                </div>
                                <div class="form-group">
                                    <label for="password">User Password</label>
                                    <input name="user_password" type="password" class="form-control" id="password" aria-describedby="emailHelp" placeholder="Enter Your Password">
                                    <!--<small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>-->
                                </div>
                                <div class="form-group">
                                    <label for="phone">User Phone</label>
                                    <input name="user_phone" type="number" class="form-control" id="phone" aria-describedby="emailHelp" placeholder="Enter Your Phone Number">
                                    <!--<small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>-->
                                </div>
                                <div class="form-group">
                                    <label for="phone">User Address</label>
                                    <textarea name="user_address" style="height:200px" class="form-control" placeholder="Enter Your Address"></textarea>
                                    <!--<small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>-->
                                </div>

                                <div class="container text-center">
                                    <button class="btn btn-outline-success" type="submit" value="Submit">Register</button>
                                    <button class="btn btn-outline-warning" type="reset" value="Reset">Reset</button>
                                </div>
                                
                                <div class="container text-center mt-2">
                                    <p> Already Registerd?
                                        <a href="login.jsp">Log In</a>
                                    </p>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
