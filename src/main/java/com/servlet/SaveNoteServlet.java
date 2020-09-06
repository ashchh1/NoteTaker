package com.servlet;

import com.entities.Note;
import com.helper.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.enterprise.inject.Model;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class SaveNoteServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        if (title.isEmpty() && content.isEmpty()) {
            
            request.setAttribute("msg", "Please fill the fields first!");
            request.setAttribute("idd", "");
            RequestDispatcher rd = request.getRequestDispatcher("add_note.jsp");
            rd.forward(request, response);
        } else {
            Note note = new Note(title, content, new Date());
            System.out.println(note.getId() + " : " + note.getTitle());
            Session s = FactoryProvider.getFactory().openSession();

            Transaction tx = s.beginTransaction();

            s.save(note);

            tx.commit();
            s.close();
            System.out.println("Welcome here!");
            System.out.println("__________________________");
            request.setAttribute("msg", "Successfully Added!");
            String idd="Id : "+note.getId();
            request.setAttribute("idd", idd);
            RequestDispatcher rd = request.getRequestDispatcher("add_note.jsp");
            rd.forward(request, response);
        }
//        response.sendRedirect("add_note.jsp");
//        response.setContentType("text/html;charset=UTF-8");
//        try ( PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet SaveNoteServlet</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet SaveNoteServlet at " + request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
//        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
