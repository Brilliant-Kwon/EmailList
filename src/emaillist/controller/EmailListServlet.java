package emaillist.controller;

import emaillist.dao.EmailListDao;
import emaillist.dao.EmailListDaoImpl;
import emaillist.vo.EmailVo;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

//서블릿 애너테이션 선언
@WebServlet(name = "EmailList", urlPatterns = "/el")
public class EmailListServlet extends BaseServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //DAO로부터 list받아오기
        //parameter a
        //a = "form" -> FORWARD
        String actionName = req.getParameter("a");

        if ("form".equals(actionName)) {
            //폼 페이지로 포워드
            RequestDispatcher rd = req.getServletContext().getRequestDispatcher("/WEB-INF/views/form.jsp");
            rd.forward(req, resp);
        } else {

            EmailListDao dao = new EmailListDaoImpl(dbUser, dbPass);
            List<EmailVo> list = dao.getList();

            req.setAttribute("list", list);

            RequestDispatcher rd = req.getServletContext().getRequestDispatcher("/WEB-INF/views/index.jsp");
            rd.forward(req, resp);
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String actionName = req.getParameter("a");
        if ("insert".equals(actionName)) {
            //이메일 등록
            String lastName = req.getParameter("last_name");
            String firstName = req.getParameter("first_name");
            String email = req.getParameter("email");

            EmailVo vo = new EmailVo(lastName, firstName, email);
            EmailListDao dao = new EmailListDaoImpl(dbUser, dbPass);

            boolean success = dao.insert(vo);

            if (success) {
                System.out.println("INSERT SUCCESS");
            } else {
                System.out.println("INSERT FAILED");
            }
            //각 상황별로 메시지를 보여줘야 하겠지만
            resp.sendRedirect(req.getContextPath() + "/el");
        } else if ("delete".equals(actionName)) {
            //이메일 삭제
            String no = req.getParameter("no");

            EmailListDao dao = new EmailListDaoImpl(dbUser, dbPass);

            boolean success = dao.delete(Long.parseLong(no));

            if (success) {
                System.out.println("DELETE SUCCESS");
            } else {
                System.out.println("DELETE FAILED");
            }
            //각 상황별로 메시지를 보여줘야 하겠지만
            resp.sendRedirect(req.getContextPath() + "/el");
        }
    }
}
