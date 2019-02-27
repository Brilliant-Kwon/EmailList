<%--
  Created by IntelliJ IDEA.
  User: k1212
  Date: 2019-02-26
  Time: 오후 5:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>인서트 완료</title>
    <link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/form.css.css">

</head>
<body>
<h1>인서트 결과</h1>

<div id="container">
    <div class="header">
        <h1>메일링 리스트 가입</h1>
    </div>
    <div class="content">
        <%--내용추가 : 리스트--%>
        가입 폼
    </div>
    <div class="footer">
        <a href="">추가 이메일 등록"</a>
    </div>
</div>

<h2>삽입</h2>
<form method="post" action="form.jsp">
    <label for="last_name"></label>
    <input type="text" name="last_name" placeholder="성을 입력하세요."><br>
    <input type="text" name="first_name" placeholder="이름을 입력하세요."><br>
    <input type="text" name="email" placeholder="이메일을 입력하세요."><br>

    <input type="submit" value="전송">
    <input type="reset" value="리셋"><br>
</form>


</body>
</html>
