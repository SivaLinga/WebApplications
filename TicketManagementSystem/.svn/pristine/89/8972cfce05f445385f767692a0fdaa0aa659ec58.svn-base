package com.crmindz.controller;

import java.util.List;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.crmindz.model.LoginInfo;
import com.crmindz.service.TicketManagementService;

/**
 * @author SivaramaKrishna Linga This class acts as controller for the whole
 *         application. Every method in this class is invoked based on the
 *         requestMapping annotation value.
 */
@Controller
public class loginController {

	@Autowired
	TicketManagementService registrationService;

	

	/**
	 * @param login
	 * @param model
	 * @param session
	 * @return This method maps the login credentials entered by the user and set
	 *         the loginID as sessionAttribute. If the login is valid, appropriate
	 *         display page is shown to the user.
	 */
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginUser(LoginInfo login, ModelMap model, HttpSession session) {
		System.out.println(login);
		List<LoginInfo> loginDetailsFromDb = registrationService.validateLogin(login);
		// if the provided email is invalid
		if (loginDetailsFromDb.isEmpty())
			return "loginerror";
		else {
			// if the email is valid, it checks the correct password.
			if (login.getPassword().equals(loginDetailsFromDb.get(0).getPassword())) {
				String sessionID = session.getId();
				System.out.println(sessionID);

				// if the login details are correct, allocate login_id as session attribute
				session.setAttribute("sloginID", loginDetailsFromDb.get(0).getLoginId());
				String userType = loginDetailsFromDb.get(0).getUserType();

				// checking the user type to return proper view
				if ("student".equals(userType) || "consultant".equals(userType))
					return "studentloginsuccess";
				else
					return "employeeloginsuccess";

			} else
				return "loginerror";
		}
	}

	/**
	 * when user click on logout, session gets invalidated and return to the home
	 * page.
	 * 
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "home";
	}

}
