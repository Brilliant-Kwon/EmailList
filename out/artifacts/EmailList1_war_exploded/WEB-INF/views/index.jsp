<%@ page import="emaillist.dao.EmailListDao" %>
<%@ page import="emaillist.dao.EmailListDaoImpl" %>
<%@ page import="java.util.List" %>
<%@ page import="emaillist.vo.EmailVo" %>
<%--
  Created by IntelliJ IDEA.
  User: k1212
  Date: 2019-02-26
  Time: 오후 3:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%
    //더이상 필요 없음
    /*ServletContext context = request.getServletContext();
    String dbUser = context.getInitParameter("dbUser");
    String dbPass = context.getInitParameter("dbPass");*/
%>
<html>
<head>
    <title>메일링 리스트</title>
    <link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/index.css">
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/form.js"></script>
</head>
<body>
<%
    //DAO로부터 리스트를 받아와 봅시다.
//    EmailListDao dao = new EmailListDaoImpl("bituser", "bituser");

    //더 이상 필요 없음
    /*EmailListDao dao = new EmailListDaoImpl(dbUser, dbPass);
    List<EmailVo> list = dao.getList();*/

    List<EmailVo> list = (List<EmailVo>) request.getAttribute("list");
%>

<div id="container">
    <div class="header">
        <h1>메일링 리스트(서블릿 버전)</h1>
    </div>
    <div class="content">
        <%--내용추가 : 리스트--%>

        <% for (EmailVo vo : list) { %>

        <table class="list_item">
            <tr>
                <th>성</th>
                <td><%=vo.getLastName()%>
                </td>
            </tr>
            <tr>
                <th>이름</th>
                <td><%=vo.getFirstName()%>
                </td>
            </tr>
            <tr>
                <th>이메일</th>
                <td><%=vo.getEmail()%>
                </td>
            </tr>
            <tr class="toolbar">
                <td colspan="2">
                    <%--삭제를 위한 폼 --%>
                    <form method="post" action="<%=request.getContextPath()%>/el"
                          onsubmit="return delete_email(this)">
                        <input type="hidden" name="a" value="delete"/>
                        <input type="hidden" name="no" value="<%= vo.getNo()%>">
                        <input type="submit" value="삭제">
                    </form>
                </td>
            </tr>
        </table>

        <%}%>

    </div>
    <div class="footer">
        <a href="<%=request.getContextPath()%>/el?a=form">추가 이메일 등록</a>
    </div>
</div>
</body>
</html>
