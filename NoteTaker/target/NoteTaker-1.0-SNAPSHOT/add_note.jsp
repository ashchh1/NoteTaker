<%-- 
    Document   : add_note
    Created on : 15-Aug-2020, 5:32:11 pm
    Author     : A_K_CHHILLAR
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="add_css_js.jsp" %>
        <title>Add new Notes</title>
    </head>
    <body>
        <div class="container-fluid p-0 m-0">
            <%@include file="navbar.jsp"  %>
            <hr>
            <h1 class="text-center">Add New Notes</h1>

        </div>
        <div class="container">
            <form action="SaveNoteServlet" method="post">
                <%
                    if(request.getAttribute("msg")!=null){
                %>
                <div class="alert alert-success text-center" role="alert">
                    ${msg}<br>
                    ${idd}
                </div>
                <%}%>
                <div class="form-group">
                    <label for="exampleInputEmail1">Note title</label>
                    <input type="text" name="title" class="form-control" id="title" aria-describedby="emailHelp" placeholder="Enter Title">
                </div>
                <div class="form-group">
                    <label for="exampleInputPassword1">Note Content</label>
                    <textarea class="form-control" name="content" id="content" placeholder="Enter content" style="height: 200px;"></textarea>
                </div>
                <div class="text-center">
                    <button type="submit" class="btn btn-success">Add</button>
                </div>
            </form>
        </div>
    </body>
</html>
