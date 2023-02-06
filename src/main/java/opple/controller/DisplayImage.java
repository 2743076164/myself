package opple.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.FileInputStream;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class DisplayImage {
	@RequestMapping(value = "/DisplayImage", method = RequestMethod.GET)
	public void display(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String file = "D:/tmp/" + request.getParameter("src");//本地路径
//		String file = "/myImage/" + request.getParameter("src");	//阿里云路径
		response.setContentType("image/jpeg");
		ServletOutputStream out;
		out = response.getOutputStream();
		FileInputStream fin = new FileInputStream(file);
		BufferedInputStream bin = new BufferedInputStream(fin);
		BufferedOutputStream bout = new BufferedOutputStream(out);
		int ch = 0;
		while ((ch = bin.read()) != -1) {
			bout.write(ch);
		}
		bin.close();
		fin.close();
		bout.close();
		out.close();
	}
}