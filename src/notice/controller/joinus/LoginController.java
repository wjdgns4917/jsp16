package notice.controller.joinus;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.controller.Controller;

public class LoginController implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("LoginController 통과");
		
		request.getRequestDispatcher("loginForm.jsp").forward(request, response);
		
	}

}
