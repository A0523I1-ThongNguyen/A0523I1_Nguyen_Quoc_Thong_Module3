package com.example.demo4;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "Product" , value = "/product")
public class Product extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       double price  = Double.parseDouble(req.getParameter("price"));
       double discount = Double.parseDouble(req.getParameter("discount"));
       double resultDiscount = price * discount * 0.01;
       double priceAfterDiscount = price - resultDiscount;
       req.setAttribute("resultDiscount",resultDiscount);
       req.setAttribute("priceAfterDiscount",priceAfterDiscount);

        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/product.jsp");
        requestDispatcher.forward(req,resp);

    }
}
