package opple.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import opple.pojo.User;
@SessionAttributes("user")
public class LoginInterceptor implements HandlerInterceptor{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String url=request.getRequestURI();
		if (url.indexOf("/login")>0 || url.indexOf("/userLogin")>0) {
			return true;
		}
		HttpSession userSession=request.getSession();
		User user=(User)userSession.getAttribute("user");
		if (user!=null) {
			return true;
		} else {
			request.setAttribute("url", "login");
			request.setAttribute("infomation", "您还没有登陆，请先登陆！");
			request.setAttribute("second", 2);
			request.getRequestDispatcher("/WEB-INF/jsp/tip.jsp").forward(request, response);
			return false;
		}
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

}
