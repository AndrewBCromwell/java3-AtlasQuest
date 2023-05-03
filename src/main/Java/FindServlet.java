import com.atlasquest.DataAccess.LetterboxAccessor;
import com.atlasquest.DataObjects.Letterbox;
import com.atlasquest.DataObjects.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "FindServlet", value = "/find")
public class FindServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if(user == null){
            request.setAttribute("message", "You need to be logged in to record a find.");
        }else{
            String letterboxId = request.getParameter("box");
            LetterboxAccessor lbAccess = new LetterboxAccessor();
            Letterbox letterbox = null;
            try {
                letterbox = lbAccess.SelectLetterboxeByLetterboxId(Integer.parseInt(letterboxId));
            }catch (Exception ex){
                request.setAttribute("message", "The letterbox you selected is not in the database.");
            }

            if(letterbox != null){
                try{
                    lbAccess.FoundBox(letterbox.getId(), user.getId());
                    request.setAttribute("message", "Thank you for finding " + letterbox.getName() + ".");
                } catch (Exception e){
                    request.setAttribute("message", "Something went wrong. Your find was not recorded.");
                }
            } else {
                request.setAttribute("invalid", "The letterbox you selected is not in the database.");
            }
        }
        request.getRequestDispatcher("WEB-INF/find.jsp").forward(request, response);
    }
}
