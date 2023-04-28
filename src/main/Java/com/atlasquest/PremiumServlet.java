package com.atlasquest;

import com.atlasquest.DataAccess.UserAccessor;
import com.atlasquest.DataObjects.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "PremiumServlet", value = "/premium")
public class PremiumServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        if(session.getAttribute("user") == null){
            request.setAttribute("message", "You need to be logged in to become Premium.");
        }else {
            User user = (User)session.getAttribute("user");
            if(user.getPrivileges().equals("premium")){
                request.setAttribute("message", "You are already Premium.");
            }else {
                try {
                    UserAccessor userAccessor = new UserAccessor();
                    int rowsAffected = userAccessor.BecomePremium(user.getId());
                    if(rowsAffected == 1){
                        user.setPrivileges("premium");
                        request.setAttribute("message", "Congratulations! You are now Premium!");
                    }else {
                        request.setAttribute("message", "An error occurred. You have not been made Premium.");
                    }
                }catch (SQLException e){
                    request.setAttribute("message", "An error occurred. You have not been made Premium.");
                }
            }
        }
        request.getRequestDispatcher("WEB-INF/premium.jsp").forward(request, response);
    }
}
