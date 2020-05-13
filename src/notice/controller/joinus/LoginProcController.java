package notice.controller.joinus;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;



import notice.controller.Controller;
import notice.dao.MemberDao;
import notice.vo.Member;
public class LoginProcController implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("LoginProcController 통과");
		
		String uid= request.getParameter("id");
		String pwd= request.getParameter("password");
		
		MemberDao dao=new MemberDao();
		Member m=dao.getMember(uid);
		
//		System.out.println("con uid :"+m.getId());
//		System.out.println("con pwd :"+m.getPwd());
		
		if (m==null) {
			request.setAttribute("error", "아이디 틀림");
			request.getRequestDispatcher("loginForm.jsp").forward(request, response);
		}else if (!m.getPwd().equals(pwd)) {
			request.setAttribute("error", "비번 틀림");
			request.getRequestDispatcher("loginForm.jsp").forward(request, response);
		}else {
			//로그인 성공
			request.getSession().setAttribute("uid", uid);
			response.sendRedirect("../customer/notice.do");
		}
		
		request.getRequestDispatcher("loginProc.jsp").forward(request, response);
	
	}

}
