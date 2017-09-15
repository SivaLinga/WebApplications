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

import com.crmindz.model.TicketInfo;
import com.crmindz.service.TicketManagementService;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

/**
 * @author SivaramaKrishna Linga
 * This class acts as controller for the tickets creation, display tickets, approve and reject tickets.
 */
@Controller
public class TicketManagementController {

	@Autowired
	TicketManagementService registrationService;

	/**
	 * @param ticket
	 * @param model
	 * @param session
	 * @return
	 * 
	 * This method return the list of tickets created by the particular User based on ID and convert into Json Format.
	 */
	@RequestMapping(value = "/display")
	@ResponseBody
	public String retrieveTickets(TicketInfo ticket, ModelMap model, HttpSession session) {
		String sessionAttribute = (String) session.getAttribute("sloginID");
		ticket.setSessionAttribute(sessionAttribute);

		List<TicketInfo> listOfTickets = registrationService.displayTicketsByID(ticket);
		System.out.println(listOfTickets);

		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		String jsonArray = gson.toJson(listOfTickets);

		return jsonArray;
	}

	/**
	 * @param model
	 * @param session
	 * @return 
	 * This method return to the display page of Tickets, if the user is already logged in. Otherwise, login page will be displayed.
	 */
	@RequestMapping(value = "/ticket", method = RequestMethod.GET)
	public String displayTicketsByID(ModelMap model, HttpSession session) {
		String sessionAttribute = (String) session.getAttribute("sloginID");
		System.out.println(sessionAttribute);
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
	 * @param ticket
	 * @param model
	 * @param session
	 * @return
	 * 
	 * This method maps the newly added Ticket details and send it to the Service class method by setting ticket as in pending status.
	 */
	@RequestMapping(value = "/addTicket", method = RequestMethod.POST)
	public String addTikcet(TicketInfo ticket, Model model, HttpSession session) {
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
	 * @param session
	 * @return This method returns to the tickets display page, if the employee is already logged in. Otherwise, it returns to the login page.
	 */
	@RequestMapping(value = "/showTickets")
	public String displayAllTickets(HttpSession session) {
		String sessionAttribute = (String) session.getAttribute("sloginID");
		// System.out.println(sessionAttribute);
		if (sessionAttribute != null)
			return "employeeticket";
		else {
			System.out.println("Please Login First!!!");
			return "login";
		}
	}

	/**
	 * @param ticket
	 * @param model
	 * @param session
	 * @return
	 * 
	 * This method Returns list of pending tickets data in the Json Format.
	 */
	@RequestMapping(value = "/displayPending")
	@ResponseBody
	public String retrievePendingTickets(TicketInfo ticket, ModelMap model, HttpSession session) {
		String sessionAttribute = (String) session.getAttribute("sloginID");
		ticket.setSessionAttribute(sessionAttribute);
		List<TicketInfo> pendingTickets = registrationService.displayPending();
		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		String jsonArray = gson.toJson(pendingTickets);
		return jsonArray;
	}

	/**
	 * This method returns the approved tickets data to the proper ajax call in the employee ticket page.
	 * 
	 * @param ticket
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/displayApproved")
	@ResponseBody
	public String retrieveApprovedTickets(TicketInfo ticket, ModelMap model, HttpSession session) {
		String sessionAttribute = (String) session.getAttribute("sloginID");
		ticket.setSessionAttribute(sessionAttribute);
		List<TicketInfo> approvedTickets = registrationService.displayApproved();

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
	public String retrieveRejectedTickets(TicketInfo ticket, ModelMap model, HttpSession session) {
		String sessionAttribute = (String) session.getAttribute("sloginID");
		ticket.setSessionAttribute(sessionAttribute);
		List<TicketInfo> rejectedTickets = registrationService.displayRejected();

		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		String jsonArray = gson.toJson(rejectedTickets);
		return jsonArray;
	}

	/**
	 * This method changes the ticket status to approved and send updated information of the ticket to the service class.
	 * 
	 * @param ticket
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/approveTicket", method = RequestMethod.POST)
	public String approveTicket(TicketInfo ticket, Model model, HttpSession session) {
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
	 * This method changes the ticket status to rejected and send updated information of the ticket to the service class.
	 * 
	 * @param ticket
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/rejectTicket", method = RequestMethod.POST)
	public String rejectTicket(TicketInfo ticket, Model model, HttpSession session) {
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
	 * When student/consultant wants to create ticket, this method provide total number of categories coming from the service class.
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
	 * Based on the category selected, this method retrieve subcategory information from the service class.
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
