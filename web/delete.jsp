<%@ page import="emaillist.dao.EmailListDao" %>
<%@ page import="emaillist.dao.EmailListDaoImpl" %><%--
  Created by IntelliJ IDEA.
  User: k1212
  Date: 2019-02-27
  Time: 오전 11:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--
<%
    //컨텍스트 파라미터
    ServletContext context = request.getServletContext();
    String dbUser = context.getInitParameter("dbUser");
    String dbPass = context.getInitParameter("dbPass");

    //삭제하기 위한 PK (no)
    String no = request.getParameter("no");//폼데이터로 넘어오면 무조건 스트링형태

    EmailListDao dao = new EmailListDaoImpl(dbUser, dbPass);
    boolean success = dao.delete(Long.parseLong(no));

    System.out.println("DELETE success ? " + success);

    if (success) {
        System.out.println(request.getContextPath());
        response.sendRedirect(request.getContextPath());
    } else {
%>
&lt;%&ndash;<p><%=request.getParameter("last_name")%><%=request.getParameter("first_name")%> 의 이메일 추가에 실패하였습니다.</p>&ndash;%&gt;
<h1>ERROR</h1>
<p>Sorry, 못 지웠어요.</p>
<%
    }

%>--%>




<%
    // 컨텍스트 파라미터
    request.setCharacterEncoding("UTF-8");
    ServletContext context = request.getServletContext();
    String dbUser = context.getInitParameter("dbUser");
    String dbPass = context.getInitParameter("dbPass");

    // 삭제하기 위한 PK(no)
    String no = request.getParameter("no");


    EmailListDao dao = new EmailListDaoImpl(dbUser, dbPass);
    boolean success = dao.delete(Long.valueOf(no));

    if(success){
        response.sendRedirect(request.getContextPath());
    }
    else{
%>
<h1>ERROR</h1>
<p>Sorry, 못지움</p>
<%
    }
%>