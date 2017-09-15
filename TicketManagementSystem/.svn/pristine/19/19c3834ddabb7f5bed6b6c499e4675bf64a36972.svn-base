package com.crmindz.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.crmindz.model.UserInfo;
import com.crmindz.service.TicketManagementService;

/**
 * @author SivaramaKrishna Linga
 * This class acts as controller for the user registration.
 */
@Controller
public class RegistrationController {

	@Autowired
	TicketManagementService registrationService;

	/**
	 * @param model
	 * @return home 
	 * This method return home page.
	 */
	@RequestMapping(value = "/home")
	public String displayHome() {
		return "home";
	}

	/**
	 * @param user
	 * @param model
	 * @return
	 * 
	 * This method first validate the email provided by the User by calling the method in service class.
	 * If the email is valid, then register the user by sending data to the Service class.
	 */
	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	public String registerUser(UserInfo user, Model model) {

		if (registrationService.validateRegistration(user)) {
			System.out.println("Valid Registration Details..!!");
			if (registrationService.registerUser(user))
				return "login";
			else
				return "registrationerror";
		} else {
			System.out.println("Account Already Exists");
			return "invalidregistration";
		}
	}

	/**
	 * This method, return the List of states.
	 * 
	 * @return
	 */
	@RequestMapping(value = "/getState", method = RequestMethod.GET)
	@ResponseBody
	public String getStates() {
		String listOfStates = registrationService.getStates();
		return listOfStates;
	}

}
