package com.example.demo;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

    @WebServlet(name = "DiscountServlet", value = "/discount")
    public class DiscountServlet extends HttpServlet {
        @Override
        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            double price=Double.parseDouble(request.getParameter("price"));
            double discount=Double.parseDouble(request.getParameter("discount"));
            double result= price * discount * 0.01;
            double priceAfter = price - price*result;
            request.setAttribute("amount",result);
            request.setAttribute("price",priceAfter);
            RequestDispatcher requestDispatcher=request.getRequestDispatcher("/index.jsp");
            requestDispatcher.forward(request,response);
        }
    }

