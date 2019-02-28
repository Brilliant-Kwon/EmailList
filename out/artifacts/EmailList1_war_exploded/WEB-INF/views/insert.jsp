<%@ page import="java.util.Enumeration" %>
<%@ page import="emaillist.dao.EmailListDao" %>
<%@ page import="emaillist.dao.EmailListDaoImpl" %>
<%@ page import="emaillist.vo.EmailVo" %><%--
  Created by IntelliJ IDEA.
  User: k1212
  Date: 2019-02-27
  Time: 오전 10:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    //요청 인코딩 설정
    request.setCharacterEncoding("UTF-8");
    //파라미터 확인
    Enumeration<String> paramNames = request.getParameterNames();

    while (paramNames.hasMoreElements()) {
        String paramName = paramNames.nextElement();
        String paramValue = request.getParameter(paramName);

        System.out.println(paramName + ":" + paramValue);
%>
<p>
    <%=paramName%> : <%=paramValue%>
</p>
<%
    }


    ServletContext context = request.getServletContext();
    String dbUser = context.getInitParameter("dbUser");
    String dbPass = context.getInitParameter("dbPass");

    EmailListDao dao = new EmailListDaoImpl(dbUser, dbPass);
    EmailVo vo = new EmailVo(request.getParameter("last_name"), request.getParameter("first_name"), request.getParameter("email"));
    boolean success = dao.insert(vo);

    System.out.println("INSERT success ? " + success);


    if (success) { //리스트 출력
        System.out.println(request.getContextPath());
        response.sendRedirect(request.getContextPath()+"/");//리스트 화면으로 돌려보냄
    } else { //오류메시지 출력
%>
<%--<p><%=request.getParameter("last_name")%><%=request.getParameter("first_name")%> 의 이메일 추가에 실패하였습니다.</p>--%>
<h1>ERROR</h1>
<p>데이터 입력 중 오류가 발생하였습니다.</p>
<%

    }
%>