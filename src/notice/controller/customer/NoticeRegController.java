package notice.controller.customer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.controller.Controller;
import notice.dao.NoticeDao;
import notice.vo.Notice;

public class NoticeRegController implements Controller{
	
	@Override
	public void execute(HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
		request.getRequestDispatcher("noticeReg.jsp").forward(request, response);
		System.out.println("NoticeRegController 신호");

	}
	
}
