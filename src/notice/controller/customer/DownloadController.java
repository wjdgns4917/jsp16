package notice.controller.customer;

import java.io.FileInputStream;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.controller.Controller;

public class DownloadController implements Controller{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("DownloadController 통과");
		String path= request.getParameter("p");
		String fname= request.getParameter("f");
		String urlPath= path+"/"+fname;
		String realPath= request.getServletContext().getRealPath(urlPath);
		System.out.println("realPath : "+realPath);
		
		response.setHeader("Content-Disposition", 
				"attachment;filename="+new String(fname.getBytes(),"ISO8859_1"));
		FileInputStream fin=new FileInputStream(realPath);
		ServletOutputStream sout=response.getOutputStream();
		
		byte[] buf=new byte[1024];
		int size=0;
		while ((size=fin.read(buf, 0, 1024))!=-1) {
			sout.write(buf,0,size);
		}
		fin.close();
		sout.close();	
	}

}
