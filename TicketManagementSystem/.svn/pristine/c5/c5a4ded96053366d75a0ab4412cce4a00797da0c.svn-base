 package com.crmindz.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crmindz.dao.TicketManagementDaoImpl;
import com.crmindz.model.LoginInfo;
import com.crmindz.model.TicketInfo;
import com.crmindz.model.UserInfo;

/**
 * @author SivaramaKrishnaLinga
 *
 */
@Service
public class TicketManagementService {
	@Autowired
	TicketManagementDaoImpl ticketManagementDaoImpl;

	/** This method validate the email entered by the user.
	 * @param user
	 * @return
	 */
	public boolean validateRegistration(UserInfo user) {
		List<LoginInfo> listOfEmails = ticketManagementDaoImpl.retrieveEmail(user);
		if (listOfEmails.isEmpty())
			return true;
		else
			return false;
	}

	/**This method forward the registration form data to the DAO class.
	 * @param user
	 * @return
	 */
	public boolean registerUser(UserInfo user) {
		if (ticketManagementDaoImpl.registerUser(user))
			return true;
		else
			return false;
	}

	/**This method validate login credentials
	 * @param login
	 * @return
	 */
	public List<LoginInfo> validateLogin(LoginInfo login) {
		List<LoginInfo> loginDetailsFromDb = ticketManagementDaoImpl.getLoginDetails(login);
		return loginDetailsFromDb;
	}

	/**This method returns tickets created by the User from DAO to the Controller class.
	 * @param ticket
	 * @return
	 */
	public List<TicketInfo> displayTicketsByID(TicketInfo ticket) {
		List<TicketInfo> listOfTickets = ticketManagementDaoImpl.displayTicketDataByID(ticket);
		return listOfTickets;
	}

	/**This method send created ticket information from the Controller to the DAO.
	 * @param ticket
	 * @return
	 */
	public boolean addTicket(TicketInfo ticket) {
		if (ticketManagementDaoImpl.addTicket(ticket)) {
			return true;
		} else
			return false;
	}

	/**This method sends pending tickets data from DAO to the controller.
	 * @return
	 */
	public List<TicketInfo> displayPending() {
		List<TicketInfo> pendingTickets = new ArrayList<TicketInfo>();
		List<TicketInfo> listOfTickets = ticketManagementDaoImpl.displayAllTickets();
		for (TicketInfo ticket : listOfTickets) {
			if ("pending".equals(ticket.getTstatus())) {
				pendingTickets.add(ticket);
			}
		}
		return pendingTickets;
	}

	/**This method get the approved Tickets Data from the DAO class and send it to the controller.
	 * @return
	 */
	public List<TicketInfo> displayApproved() {
		List<TicketInfo> pendingTickets = new ArrayList<TicketInfo>();
		List<TicketInfo> listOfTickets = ticketManagementDaoImpl.displayAllTickets();
		for (TicketInfo ticket : listOfTickets) {
			if ("approved".equals(ticket.getTstatus())) {
				pendingTickets.add(ticket);
			}
		}
		return pendingTickets;
	}

	/**This method get the rejected Tickets Data from the DAO class and send it to the controller.
	 * @return List of rejected Tickets to the Controller.
	 */
	public List<TicketInfo> displayRejected() {
		List<TicketInfo> pendingTickets = new ArrayList<TicketInfo>();
		List<TicketInfo> listOfTickets = ticketManagementDaoImpl.displayAllTickets();
		for (TicketInfo ticket : listOfTickets) {
			if ("rejected".equals(ticket.getTstatus())) {
				pendingTickets.add(ticket);
			}
		}
		return pendingTickets;
	}

	/**
	 * @param ticket
	 * @return
	 * 
	 * This method forward updated ticket information to the DAO and return true if the data is updated properly.
	 */
	public boolean approveTicket(TicketInfo ticket) {
		if (ticketManagementDaoImpl.processTicket(ticket)) {
			return true;
		} else {
			return false;
		}
	}

	/**
	 * @param ticket
	 * @return
	 * This method forward the rejected ticket information to the DAO and return true if the update operation occurred properly.
	 */
	public boolean rejectTicket(TicketInfo ticket) {
		if (ticketManagementDaoImpl.processTicket(ticket)) {
			return true;
		} else {
			return false;
		}
	}

	/**This method generate random 10 digit alpha numeric number.
	 * @return saltStr
	 */
	public String generateTicketNumber() {
		String SALTCHARS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
		StringBuilder salt = new StringBuilder();
		Random rnd = new Random();
		while (salt.length() < 10) { // length of the random string.
			int index = (int) (rnd.nextFloat() * SALTCHARS.length());
			salt.append(SALTCHARS.charAt(index));
		}
		String saltStr = salt.toString();
		return saltStr;
	}

	/**This method append all the states data from the DAO to the variable state and send it to the controller method.
	 * @return states
	 */
	public String getStates() {
		String states = "";
		List<Map<String, Object>> listOfStates = ticketManagementDaoImpl.getStates();
		for (Map<String, Object> map : listOfStates) {
			for (Map.Entry<String, Object> entry : map.entrySet())
				states += "<option value='" + entry.getValue() + "'>" + entry.getValue() + "</option>";
		}
		return states;
	}

	/** This method method append all the categories data returned from DAO to the variable categoryData and send it to the controller.
	 * @return categorydata
	 */
	public String getCategories() {
		String categoryData = "";
		List<Map<String, Object>> categories = ticketManagementDaoImpl.getCategoriesList();
		for (Map<String, Object> map : categories) {
			for (Map.Entry<String, Object> entry : map.entrySet())
				categoryData += "<option value='" + entry.getValue() + "'>" + entry.getValue() + "</option>";
		}
		return categoryData;
	}

	/**This method append all the subcategory data acquired from DAO to the variable subCategoryData and return that variable to the controller.
	 * @param categoryValue
	 * @return subCategoryData
	 */
	public String getSubCategories(String categoryValue) {
		String subCategoryData = "";
		List<Map<String, Object>> SubCategories = ticketManagementDaoImpl.getSubCategoriesList(categoryValue);
		for (Map<String, Object> map : SubCategories) {
			for (Map.Entry<String, Object> entry : map.entrySet())
				subCategoryData += "<option value='" + entry.getValue() + "'>" + entry.getValue() + "</option>";
		}
		return subCategoryData;
	}

}
