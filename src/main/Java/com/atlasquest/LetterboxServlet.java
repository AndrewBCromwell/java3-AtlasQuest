package com.atlasquest;

import com.atlasquest.DataAccess.LetterboxAccessor;
import com.atlasquest.DataObjects.Letterbox;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "LetterboxServlet", value = "/letterboxclue")
public class LetterboxServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       String letterboxId = request.getParameter("id");
       LetterboxAccessor lbAccess = new LetterboxAccessor();
       Letterbox letterbox = null;
       try {
           letterbox = lbAccess.SelectLetterboxeByLetterboxId(Integer.parseInt(letterboxId));
       }catch (Exception ex){
           request.setAttribute("invalid", "The letterbox id does not exist.");
       }

       if(letterbox != null){
           request.setAttribute("letterbox", letterbox);
       } else {
           request.setAttribute("invalid", "The letterbox id does not exist.");
       }

       request.getRequestDispatcher("WEB-INF/letterbox.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
