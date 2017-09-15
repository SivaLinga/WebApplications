package com.crmindz.controller;

import java.util.List;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.crmindz.model.Login;
import com.crmindz.model.Ticket;
import com.crmindz.model.User;
import com.crmindz.service.TicketManagementService;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

/**
 * @author SivaramaKrishna Linga 
 * This class acts as controller for the whole application. Every method in this class is invoked based on the requestMapping annotation value.
 */
@Controller
public class TicketManagementController {

	@Autowired
	TicketManagementService registrationService;

	/**
	 * @param model
	 * @return home
	 * This method return home page.
	 */
	@RequestMapping(value = "/home")
	public String displayHome(Model model) {
		return "home";
	}

	/**
	 * When a user wants to register, this method gets called, It first checks whether the provided email is already existed or not.
	 *If it is there already, invalid Registration page is thrown. 
	 *If user entered valid registration details, it returned to the Login page to access other functionalities.
	 *If there are some errors occurred, error page will be displayed.
	 * 
	 * @param user
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	public String registerUser(User user, Model model) {

		if (registrationService.validateRegistration(user)) {
			System.out.println("Valid Registration Details..!!");
			if (registrationService.register(user))
				return "login";
			else
				return "registrationerror";
		} else {
			System.out.println("Account Already Exists");
			return "invalidregistration";
		}
	}

	/**
	 * 
	 * In Order to access any ticket in this application, user has to login first.
	 * When user login, validateLogin method in the service class returns whether
	 * login credentials are correct or not. If the login details are valid, it
	 * again checks the user type. Based on the User type, Corresponding login
	 * success page will be displayed. If the login details are invalid, then login
	 * error page will be displayed.
	 * 
	 * @param login
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(Login login, ModelMap model, HttpSession session) {
		System.out.println(login);
		List<Login> loginDetailsFromDb = registrationService.validateLogin(login);
		// if the requested login data from the database is empty
		if (loginDetailsFromDb.isEmpty())
			return "loginerror";
		else {
			//checks the password entered by the user
			if (login.getPassword().equals(loginDetailsFromDb.get(0).getPassword())) {
				String sessionID = session.getId();
				System.out.println(sessionID);
				//setting login_id attribute to the session
				 session.setAttribute("sloginID", loginDetailsFromDb.get(0).getLoginId());
				String userType = loginDetailsFromDb.get(0).getUserType();
				//checking the user type
				if ("student".equals(userType) || "consultant".equals(userType))
					return "studentloginsuccess";
				else
					return "employeeloginsuccess";
			} else
				return "loginerror";
		}
	}

	/**
	 * This method is used by the Ajax call to display the created tickets of
	 * student or consultant. It gives the response to the Jqgrid Ajax call in the
	 * studentticket page.
	 * 
	 * @param ticket
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/display")
	@ResponseBody
	public String retrieveTickets(Ticket ticket, ModelMap model, HttpSession session) {
		String sessionAttribute = (String) session.getAttribute("sloginID");
		ticket.setSessionAttribute(sessionAttribute);
		List<Ticket> listOfTickets = registrationService.displayTicketsByID(ticket);
		//System.out.println(listOfTickets);
		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		String jsonArray = gson.toJson(listOfTickets);
		// jsonArray = "{\"page\":1,\"total\":\"4\",\"records\":" + listOfTickets.size()
		// + ",\"rows\":" + jsonArray + "}";
		return jsonArray;
	}

	/**
	 * when student/consultant click on the Tickets, this method gets invoked. If
	 * the user already logged in , it returns to the studentticket page.
	 * 
	 * 
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/ticket", method = RequestMethod.GET)
	public String displayTicketsByID(ModelMap model, HttpSession session) {
		String sessionAttribute = (String) session.getAttribute("sloginID");
		//System.out.println(sessionAttribute);
		if (sessionAttribute != null) {
			model.put("login", sessionAttribute);
			return "studentticket";
		}

		else {
			System.out.println("Please Login First!!!");
			return "login";
		}
	}

	/**
	 * This method is used when student/consultant wants to add ticket. After ticket is created to successfully, it returns to the studentticket page to update
	 * the table through ajax calls.
	 * 
	 * @param ticket
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/addTicket", method = RequestMethod.POST)
	public String addTikcet(Ticket ticket, Model model, HttpSession session) {
		String sessionAttribute = (String) session.getAttribute("sloginID");
		// System.out.println(ticket);
		if (sessionAttribute != null) {
			ticket.setSessionAttribute(sessionAttribute);
			ticket.setTstatus("pending");
			String ticketNumber = registrationService.generateTicketNumber();
			ticket.setTicketNumber(ticketNumber);
			if (registrationService.addTicket(ticket)) {
				return "studentticket";
			} else {
				System.out.println("Problem in adding Ticket");
				return "home";
			}
		} else {
			System.out.println("Please Login First");
			return "login";
		}
	}

	/**
	 * It displays total number of pending tickets to the employee.
	 * 
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/showTickets")
	public String displayAllTickets(HttpSession session) {
		String sessionAttribute = (String) session.getAttribute("sloginID");
		//System.out.println(sessionAttribute);
		if (sessionAttribute != null) {
			return "employeeticket";
		}

		else {
			System.out.println("Please Login First!!!");
			return "login";
		}
	}

	/**
	 * It retrieve all the pending tickets information to the Ajax call in employeeticket page.
	 * 
	 * @param ticket
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/displayPending")
	@ResponseBody
	public String retrievePendingTickets(Ticket ticket, ModelMap model, HttpSession session) {
		String sessionAttribute = (String) session.getAttribute("sloginID");
		ticket.setSessionAttribute(sessionAttribute);
		List<Ticket> pendingTickets = registrationService.displayPending();
		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		String jsonArray = gson.toJson(pendingTickets);
		return jsonArray;
	}

	/**
	 * This method returns the approved tickets data to the proper ajax call in the
	 * employeeticket page.
	 * 
	 * @param ticket
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/displayApproved")
	@ResponseBody
	public String retrieveApprovedTickets(Ticket ticket, ModelMap model, HttpSession session) {
		String sessionAttribute = (String) session.getAttribute("sloginID");
		ticket.setSessionAttribute(sessionAttribute);
		List<Ticket> approvedTickets = registrationService.displayApproved();
		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		String jsonArray = gson.toJson(approvedTickets);
		return jsonArray;
	}

	/**
	 * This method returns the rejected tickets data to the proper ajax call in the employeeticket page
	 * 
	 * @param ticket
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/displayRejected")
	@ResponseBody
	public String retrieveRejectedTickets(Ticket ticket, ModelMap model, HttpSession session) {
		String sessionAttribute = (String) session.getAttribute("sloginID");
		ticket.setSessionAttribute(sessionAttribute);
		List<Ticket> rejectedTickets = registrationService.displayRejected();
		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		String jsonArray = gson.toJson(rejectedTickets);
		return jsonArray;
	}

	/**
	 * This method changes the ticket status to approved and add comments to the
	 * database which are provided by employee.
	 * 
	 * @param ticket
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/approveTicket", method = RequestMethod.POST)
	public String approveTicket(Ticket ticket, Model model, HttpSession session) {
		String sessionAttribute = (String) session.getAttribute("sloginID");
		if (sessionAttribute != null) {
			ticket.setSessionAttribute(sessionAttribute);
			ticket.setTstatus("approved");
			if (registrationService.approveTicket(ticket)) {
				return "employeeticket";
			} else {
				System.out.println("Problem Occured in Approving Ticket");
				return "home";
			}
		} else {
			return "login";
		}
	}

	/**
	 * This method change the status of the ticket from pending to rejected and add
	 * the comments of the rejected ticket to the database.
	 * 
	 * @param ticket
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/rejectTicket", method = RequestMethod.POST)
	public String rejectTicket(Ticket ticket, Model model, HttpSession session) {
		String sessionAttribute = (String) session.getAttribute("sloginID");
		System.out.println(ticket);
		if (sessionAttribute != null) {
			ticket.setSessionAttribute(sessionAttribute);
			ticket.setTstatus("rejected");
			if (registrationService.rejectTicket(ticket)) {
				return "employeeticket";
			} else {
				return "home";
			}
		} else {
			return "login";
		}
	}

	/**
	 * when user click on logout, created session gets invalidate.
	 * 
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "home";
	}

	/**
	 * It returns all the states data from the service class and provided to the
	 * ajax call when user wants to register.
	 * 
	 * @return
	 */
	@RequestMapping(value = "/getState", method = RequestMethod.GET)
	@ResponseBody
	public String getStates() {
		String listOfStates = registrationService.getStates();
		return listOfStates;
	}

	/**
	 * When student/consultant wants to create ticket, this method provide total
	 * number of categories present in the Database.
	 * 
	 * @return
	 */
	@RequestMapping(value = "/getCategories", method = RequestMethod.GET)
	@ResponseBody
	public String getCategories() {
		String categoryData = registrationService.getCategories();
		return categoryData;
	}

	/**
	 * Based on the category selected, this method retrieve subcategory information
	 * from the service class.
	 * 
	 * @param categoryValue
	 * @return
	 */
	@RequestMapping(value = "/getSubCategories", method = RequestMethod.GET)
	@ResponseBody
	public String getSubCategories(String categoryValue) {
		String subCategoriesData = registrationService.getSubCategories(categoryValue);
		return subCategoriesData;
	}

}
