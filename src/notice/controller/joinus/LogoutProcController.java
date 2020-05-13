package notice.controller.joinus;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.controller.Controller;

public class LogoutProcController implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("LogoutProcController 통과");
		request.getSession().invalidate();
		response.sendRedirect("../customer/notice.do");
		
	}

}
