package com.atlasquest;

import com.atlasquest.DataAccess.UserAccessor;
import com.atlasquest.DataObjects.User;
import org.mindrot.jbcrypt.BCrypt;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "LoginServlet", value = "/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("loginFailed", false);
        HttpSession session = request.getSession();
        request.changeSessionId();
        session.removeAttribute("user");
        request.getRequestDispatcher("WEB-INF/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String trailName = request.getParameter("trailName");
        String password = request.getParameter("password");
        if(trailName.equals("") || password.equals("") || trailName == null || password == null) {
            System.out.println("email or password missing");
            request.setAttribute("loginFailed", true);
            request.getRequestDispatcher("WEB-INF/login.jsp").forward(request, response);
            return;
        }

        UserAccessor userAccessor = new UserAccessor();
        try{
            User user = userAccessor.SelectUserByTrailNameAndPassword(trailName, password);
            if(user == null) {
                request.setAttribute("loginFailed", true);
                request.getRequestDispatcher("WEB-INF/login.jsp").forward(request, response);
                return;
            } else {
                    // CORRECT MATCH!
                    HttpSession session = request.getSession();
                    request.changeSessionId();
                    System.out.println(session.getId());
                    session.setAttribute("user", user);
                    response.sendRedirect(request.getContextPath());
                    return;
            }
        }catch (SQLException e){
            request.setAttribute("loginFailed", true);
        }
    }
}
