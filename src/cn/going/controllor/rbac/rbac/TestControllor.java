package cn.going.controllor.rbac.rbac;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "login.do")
public class TestControllor {
	@RequestMapping(params ={ "action=login"})
	public String login(HttpServletRequest request, HttpServletResponse response,
			ModelMap modelMap) {
		System.out.println("OK");
		return "/login";
	}

}
