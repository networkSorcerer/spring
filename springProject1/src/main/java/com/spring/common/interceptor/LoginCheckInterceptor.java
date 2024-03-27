package com.spring.common.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;

import com.spring.admin.login.vo.AdminLoginVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class LoginCheckInterceptor implements HandlerInterceptor{
	@Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        // 1. 세션에서 로그인 정보 조회
        HttpSession session = request.getSession();
        AdminLoginVO admin = (AdminLoginVO) session.getAttribute("adminLogin");

        // 2. 회원 정보 체크
        if (admin == null) {
            response.sendRedirect("/admin/login");
            return false;
        }

        return HandlerInterceptor.super.preHandle(request, response, handler);
    }

}
