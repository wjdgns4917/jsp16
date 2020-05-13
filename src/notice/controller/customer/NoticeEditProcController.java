package notice.controller.customer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.controller.Controller;
import notice.dao.NoticeDao;
import notice.vo.Notice;

public class NoticeEditProcController implements Controller{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		String seq=request.getParameter("c");
		System.out.println("noticeEditProcController 신호");

		Notice n=new Notice();
		n.setSeq(seq);
		n.setTitle(title);
		n.setContent(content);

		NoticeDao dao=new NoticeDao();
		int af=dao.update(n);
		
		request.setAttribute("n", n);
		request.getRequestDispatcher("noticeDetail.jsp").forward(request, response);
		


		
	}

}

