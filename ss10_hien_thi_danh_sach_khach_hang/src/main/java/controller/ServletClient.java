package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Client;
import service.ClientService;
import service.IClientService;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "ServletClient", value = "/cli")
public class ServletClient extends HttpServlet {
    private IClientService iClientService = new ClientService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Client> list = iClientService.showService();
        request.setAttribute("list",list);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/client.jsp");
        dispatcher.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
