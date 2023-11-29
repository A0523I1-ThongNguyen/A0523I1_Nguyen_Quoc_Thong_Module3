package com.example.demo4;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "Servlet", value = "/km")
public class test extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Double gia = Double.parseDouble(request.getParameter("gia"));
        Double khuyenMai = Double.parseDouble(request.getParameter("khuyenmai"));
        Double applyKhuyenMai = gia -khuyenMai;
        Double giaMua = gia - applyKhuyenMai;

        request.setAttribute("applyKhuyenMai",applyKhuyenMai);
        request.setAttribute("giaMua",giaMua);

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/test.jsp");
        requestDispatcher.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
