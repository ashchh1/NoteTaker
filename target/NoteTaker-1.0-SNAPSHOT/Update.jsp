<%-- 
    Document   : add_note
    Created on : 15-Aug-2020, 5:32:11 pm
    Author     : A_K_CHHILLAR
--%>

<%@page import="com.entities.Note"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
     int id = Integer.parseInt(request.getParameter("id").trim());

    Session s = FactoryProvider.getFactory().openSession();
    Note n=(Note)s.get(Note.class, id);
    s.close();
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="add_css_js.jsp" %>
        <title>Edit Notes</title>
    </head>
    <body>
        <div class="container-fluid p-0 m-0">
            <%@include file="navbar.jsp"  %>
            <hr>
            <h1 class="text-center">Edit Notes</h1>

        </div>
        <div class="container">
            <form action="EditNoteServlet" method="post">
                <input type="hidden" value="<%= n.getId() %>" name="id">
                <div class="form-group">
                    <label for="exampleInputEmail1">Note title</label>
                    <input type="text" name="title" value="<%= n.getTitle() %>" class="form-control" id="title" aria-describedby="emailHelp" placeholder="Enter Title">
                </div>
                <div class="form-group">
                    <label for="exampleInputPassword1">Note Content</label>
                    <textarea class="form-control" name="content"  id="content" placeholder="Enter content" style="height: 200px;"><%= n.getContent() %></textarea>
                </div>
                <div class="text-center">
                    <button type="submit" class="btn btn-success">Update</button>
                </div>
            </form>
        </div>
    </body>
</html>
