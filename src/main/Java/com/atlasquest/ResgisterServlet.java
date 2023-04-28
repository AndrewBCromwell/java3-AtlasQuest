package com.atlasquest;

import com.atlasquest.DataAccess.UserAccessor;
import com.atlasquest.DataObjects.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@WebServlet(name = "ResgisterServlet", value = "/register")
public class ResgisterServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("WEB-INF/register.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String trailName = request.getParameter("trailName");
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String password1 = request.getParameter("password1");
        String password2 = request.getParameter("password2");
        String[] agreeToTerms = request.getParameterValues("agree-to-terms"); // use with checkboxes
        Map<String, String> results = new HashMap<>();
        User user = new User();
        try {
            user.setTrailName(trailName);
        } catch(IllegalArgumentException e) {
            results.put("trailNameError", e.getMessage());
        }
        try {
            user.setFirstName(firstName);
        } catch(IllegalArgumentException e) {
            results.put("firstNameError", e.getMessage());
        }
        try {
            user.setLastName(lastName);
        } catch(IllegalArgumentException e) {
            results.put("lastNameError", e.getMessage());
        }
        try {
            user.setEmail(email);
        } catch(IllegalArgumentException e) {
            results.put("emailError", e.getMessage());
        }
        try {
            Pattern p = Pattern.compile("^" +
                    "(?=.*[0-9])" + // a digit must occur at least once
                    "(?=.*[a-z])" + // a lower case letter must occur at least once
                    "(?=.*[A-Z])" + // an upper case letter must occur at least once
                    // "(?=.*[@#$%^&+=])" + // a special character must occur at least once
                    // "(?=\\S+$)" + // no whitespace allowed in the entire string
                    ".{8,}" + // anything, at least eight characters
                    "$");
            Matcher m = p.matcher(password1);
            if(!m.matches()) {
                throw new IllegalArgumentException("Password must contain at least 8 characters, with 1 digit, 1 lowercase,and 1 uppercase letter");
            }
        } catch(IllegalArgumentException e) {
            results.put("password1Error", e.getMessage());
        }
        if(password2.equals("")) {
            results.put("password2Error", "This input is required");
        }
        if(!password1.equals(password2)) {
            results.put("password2Error", "Passwords don't match");
        }
        if(agreeToTerms == null || !agreeToTerms[0].equals("agree")){
            results.put("agreeError", "You must agree to our terms and conditions");
        }
        if(!results.containsKey("firstNameError") && !results.containsKey("lastNameError")
                && !results.containsKey("emailError") && !results.containsKey("phoneError")
                && !results.containsKey("password1Error") && !results.containsKey("password2Error")
                && !results.containsKey("agreeError") && !results.containsKey("trailNameError")
        ) {
            UserAccessor userAccessor = new UserAccessor();
            try {
                int numRowsAffected = userAccessor.InsertUsers(user.getTrailName(), user.getFirstName(), user.getLastName(), user.getEmail(), password1);
                if(numRowsAffected == 1) {
                    results.put("userAddSuccess", "The user was added successfully. Please log in to continue.");
                }
            }catch (SQLException e){
                results.put("DBError", "An error occurred. The user was not added.");
            }

        } else {
            results.put("trailName", trailName);
            results.put("firstName", firstName);
            results.put("lastName", lastName);
            results.put("email", email);
            results.put("password1", password1);
            results.put("password2", password2);
            if (agreeToTerms != null && agreeToTerms[0].equals("agree")) {
                results.put("agreeToTerms", agreeToTerms[0]);
            }
        }
        request.setAttribute("results", results);
        request.getRequestDispatcher("WEB-INF/register.jsp").forward(request, response);
    }
}
