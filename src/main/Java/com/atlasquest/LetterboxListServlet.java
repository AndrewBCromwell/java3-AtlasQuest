package com.atlasquest;

import com.atlasquest.DataAccess.LetterboxAccessor;
import com.atlasquest.DataObjects.Letterbox;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "LetterboxListServlet", urlPatterns = {"/letterbox", "/Letterbox", "/letterboxes", "/Letterboxes"})
public class LetterboxListServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        LetterboxAccessor lbAccess = new LetterboxAccessor();
        ArrayList<Letterbox> letterboxes;
        try{
            letterboxes = lbAccess.SelectAllLetterboxes();
            request.setAttribute("Letterboxes", letterboxes);
        }catch (SQLException e){
            request.setAttribute("Error", e.getMessage());
        }

        request.getRequestDispatcher("WEB-INF/LetterboxList.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        LetterboxAccessor lbAccess = new LetterboxAccessor();
        String search = request.getParameter("q");
        if(search == null){
            search = "";
        }
        ArrayList<Letterbox> letterboxes;
        try{
            letterboxes = lbAccess.SelectAllLetterboxes();
            String finalSearch = search;
            if(!search.equals("")) {
                letterboxes.removeIf(lb -> !lb.getName().toLowerCase().contains(finalSearch.toLowerCase()));
            }
            request.setAttribute("Letterboxes", letterboxes);
        }catch (SQLException e){
            request.setAttribute("Error", e.getMessage());
        }

        request.getRequestDispatcher("WEB-INF/LetterboxList.jsp").forward(request, response);
    }
}
