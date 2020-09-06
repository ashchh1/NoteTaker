<%@page import="org.hibernate.Query"%>
<%@page import="com.entities.Note"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Session"%>
<%
    int id = Integer.parseInt(request.getParameter("id").trim());

    Session s = FactoryProvider.getFactory().openSession();
    Transaction tx=s.beginTransaction();
    Note n= new Note();
    n.setId(id);
    s.delete(n);
    tx.commit();
    response.sendRedirect("all_note.jsp");
    s.close();
%>