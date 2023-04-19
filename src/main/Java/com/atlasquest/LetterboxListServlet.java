package com.atlasquest;

import com.atlasquest.DataAccess.LetterboxAccessor;
import com.atlasquest.DataObjects.Letterbox;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "LetterboxListServlet", value = "/LetterboxList", urlPatterns = {"/letterbox", "/Letterbox", "/letterboxes", "/Letterboxes"})
public class LetterboxListServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        LetterboxAccessor lbAccess = new LetterboxAccessor();
        ArrayList<Letterbox> letterboxes;
        try{
            letterboxes = lbAccess.SelectAllLetterboxes();
        }catch (SQLException e){
            request.setAttribute("Error", e.getMessage());
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}