package com.dkt.utils;

import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Enumeration;

/**
 * @author 窦康泰
 * @date 2020/11/28
 */
public class LoginInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String requestURI = request.getRequestURI();
        HttpSession session = request.getSession();
        response.setContentType("text/html;charset=utf-8");
        if (requestURI.contains("admin")) {
            Object admin = session.getAttribute("admin");
            if (admin == null) {
                response.getWriter().write("登录管理员账号后才能访问");
            }
            return admin != null;
        } else if (requestURI.contains("employee")) {
            Object employee = session.getAttribute("employee");
            if (employee == null) {
                response.getWriter().write("登录员工账号后才能访问");
            }
            return employee != null;
        } else if (requestURI.contains("customer")) {
            Object customer = session.getAttribute("customer");
            if (customer == null) {
                response.getWriter().write("登录顾客账号后才能访问");
            }
            return customer != null;
        }
        return true;
    }
}
