package notice.controller.customer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.controller.Controller;
import notice.dao.NoticeDao;
import notice.vo.Notice;

public class NoticeEditController implements Controller{
	
	@Override
	public void execute(HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
		//데이터베이스에서 seq로 select 조건이 필요
		String seq=request.getParameter("c");
		NoticeDao dao=new NoticeDao();
		Notice n=dao.getNotice(seq);
		System.out.println("NoticeEditController 신호");
		
		request.setAttribute("n", n);
		request.getRequestDispatcher("noticeEdit.jsp")
		.forward(request, response);

	}
	
}
