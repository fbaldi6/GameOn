package it.unipi.dii.inginf.dsmt.gameon.servlet;

import it.unipi.dii.inginf.dsmt.gameon.model.User;
import it.unipi.dii.inginf.dsmt.gameon.persistence.KeyValueDBDriver;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "ResultServlet", value = "/result-servlet")
public class ResultServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        processRequest(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        processRequest(request, response);
    }

    private void processRequest(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("loggedUser");

        KeyValueDBDriver db = KeyValueDBDriver.getInstance();

        System.out.println(request.getMethod());
        if (request.getParameter("hasWon").equals("true"))
            db.addUserWin(user, "connectFour");

        request.setAttribute("connectFourButton", "true");
        response.sendRedirect(request.getContextPath() + "/chooseGame-servlet");
    }
}
