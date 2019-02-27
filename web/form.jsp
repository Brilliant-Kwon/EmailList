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
    <title>메일링 리스트 가입</title>
    <%--css, js 연결--%>
    <link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/form.css.css">
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/form.js"></script>

</head>
<body>

<div id="container">
    <div class="header">
        <h1>메일링 리스트 가입</h1>
    </div>
    <div class="content">
        <%--내용추가 : 리스트--%>
        <p>메일링 리스트에 가입하려면 항목을 기입하고 등록 버튼을 클릭하세요.</p>

        <form method="post" action="<%=request.getContextPath()%>/insert.jsp"
              onsubmit="return checkForm(this)">
            <fieldset>
                <label for="last_name">성</label>
                <input type="text" name="last_name" placeholder="성을 입력하세요."><br>
            </fieldset>
            <fieldset>
                <label for="first_name">이름</label>
                <input type="text" name="first_name" placeholder="이름을 입력하세요."><br>
            </fieldset>
            <fieldset>
                <label for="email">이메일</label>
                <input type="text" name="email" placeholder="이메일을 입력하세요."><br>
            </fieldset>
            <input type="submit" value="전송">
            <input type="reset" value="초기화"><br>
        </form>
    </div>
    <div class="footer">
        <a href="<%=request.getContextPath()%>/index.jsp">목록 보기</a>
    </div>
</div>


</body>
</html>
