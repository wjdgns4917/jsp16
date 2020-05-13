package notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sound.midi.ControllerEventListener;

import notice.controller.customer.DownloadController;
import notice.controller.customer.ErrorController;
import notice.controller.customer.NoticeController;
import notice.controller.customer.NoticeDelProcController;
import notice.controller.customer.NoticeDetailController;
import notice.controller.customer.NoticeEditController;
import notice.controller.customer.NoticeEditProcController;
import notice.controller.customer.NoticeRegController;
import notice.controller.customer.NoticeRegProcController;
import notice.controller.joinus.LoginController;
import notice.controller.joinus.LoginProcController;
import notice.controller.joinus.LogoutProcController;

public class MyDispatcher extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest request, 
			HttpServletResponse response) 
					throws ServletException, IOException {
		System.out.println("service 신호");
		String uri= request.getRequestURI();
		String conPath=request.getContextPath();
		String com= uri.substring(conPath.length());
		System.out.println("uri : "+uri);
		System.out.println("conPath : "+conPath);
		System.out.println("com : "+com);
		
		Controller controller=null;
		
		try {
			if(com.equals("/customer/noticeDetail.do")) {
				controller=new NoticeDetailController();
			}else if(com.equals("/customer/noticeEdit.do")) {
				controller=new NoticeEditController();
			}else if(com.equals("/customer/noticeEditProc.do")) {
				controller=new NoticeEditProcController();
			}else if(com.equals("/customer/noticeReg.do")) {
				controller=new NoticeRegController();
			}else if(com.equals("/customer/noticeRegProc.do")) {
				controller=new NoticeRegProcController();
			}else if(com.equals("/customer/noticeDelProc.do")) {
				controller=new NoticeDelProcController();
			}else if(com.equals("/customer/notice.do")) {
				controller=new NoticeController();
			}else if(com.equals("/login/login.do")) {
				controller=new LoginController();
			}else if(com.equals("/login/loginProc.do")) {
				controller=new LoginProcController();
			}else if(com.equals("/login/logoutProc.do")) {
				controller=new LogoutProcController();
			}else if(com.equals("/customer/download.do")) {
				controller=new DownloadController();
			}
			
			if (controller==null) {
				controller=new ErrorController();
			}
			controller.execute(request, response);	
		} catch (Exception e) {			
			e.printStackTrace();
		}
		
	}
	
	@Override
	protected void doGet(HttpServletRequest request, 
			HttpServletResponse response) 
			throws ServletException, IOException {
		service(request, response);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest request, 
			HttpServletResponse response) 
			throws ServletException, IOException {
		service(request, response);
		
	}

}
