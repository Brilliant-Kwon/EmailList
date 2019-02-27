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
    ServletContext context = request.getServletContext();
    String dbUser = context.getInitParameter("dbUser");
    String dbPass = context.getInitParameter("dbPass");
%>
<html>
<head>
    <title>메일링 리스트</title>
    <link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/index.css">
</head>
<body>
<%
    //DAO로부터 리스트를 받아와 봅시다.
//    EmailListDao dao = new EmailListDaoImpl("bituser", "bituser");
    EmailListDao dao = new EmailListDaoImpl(dbUser, dbPass);
    List<EmailVo> list = dao.getList();
%>

<div id="container">
    <div class="header">
        <h1>메일링 리스트</h1>
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
        </table>

        <%}%>

    </div>
    <div class="footer">
        <a href="">추가 이메일 등록"</a>
    </div>
</div>


<h2>삽입</h2>
<form method="post" action="insert.jsp">
    <label for="last_name"></label>
    <input type="text" name="last_name" placeholder="성을 입력하세요."><br>
    <input type="text" name="first_name" placeholder="이름을 입력하세요."><br>
    <input type="text" name="email" placeholder="이메일을 입력하세요."><br>

    <input type="submit" value="전송">
    <input type="reset" value="리셋"><br>
</form>
</body>
</html>
