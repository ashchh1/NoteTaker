<%-- 
    Document   : all_note
    Created on : 16-Aug-2020, 1:25:44 pm
    Author     : A_K_CHHILLAR
--%>

<%@page import="java.util.Date"%>
<%@page import="com.entities.Note"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="add_css_js.jsp" %>
        <title>All Notes</title>
    </head>
    <body>
        <div class="container-fluid p-0 m-0">
            <%@include file="navbar.jsp"  %>
        </div>
        <div class="container">
            <hr>
            <h1 class="text-center">All Notes</h1>
            <%
                Session s = FactoryProvider.getFactory().openSession();
                Query q = s.createQuery("from Note");
                List<Note> note = q.list();
                for (Note n : note) {
            %>

            <div class="card mt-3">
                <img class="card-img-top m-4" style="max-width: 70px" src="img/pngkey.com-book-logo-png-7936169.png">
                <div class="card-body px-5">
                    <h5 class="card-title"><%= n.getTitle()%></h5>
                    <p class="card-text"><%= n.getContent()%></p>
                    <div class="card-footer text-right">
                        <small class="text-muted">Last updated : <%= n.getAddedDate() %>.</small>
                    </div>
                    <div class="text-center">
                        <a href="Delete.jsp?id=<%=n.getId()%>" class="btn btn-outline-danger" >Delete</a>
                        <a href="Update.jsp?id=<%=n.getId()%>" class="btn btn-outline-primary" >Update</a>
                    </div>
                </div>
            </div>

            <%
                }
                s.close();
            %>
        </div>
    </div>
</body>
</html>
