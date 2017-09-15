package com.crmindz.dao;

import java.util.List;
import java.util.Map;

import com.crmindz.model.LoginInfo;
import com.crmindz.model.TicketInfo;
import com.crmindz.model.UserInfo;

/**
 * @author SivaramaKrishnaLinga
 * This interface has all the method declarations of this application.
 */
public interface TicketManagementDao {

	/**
	 * This method retrieve emailid from the login table in the database
	 * 
	 * @param user
	 * @return
	 */
	public List<LoginInfo> retrieveEmail(UserInfo user);

	/**
	 * This method add the registration data to the database.
	 * 
	 * @param user
	 * @return
	 */
	public boolean registerUser(UserInfo user);

	/**
	 * This method retrieve login details from the DB based on the email provided by
	 * the user.
	 * 
	 * @param login
	 * @return
	 */
	public List<LoginInfo> getLoginDetails(LoginInfo login);

	/**
	 * This method retrieve tickets created by the user from the database.
	 * 
	 * @param ticket
	 * @return
	 */
	public List<TicketInfo> displayTicketDataByID(TicketInfo ticket);

	/**
	 * This method add the created ticket information to the database.
	 * 
	 * @param ticket
	 * @return
	 */
	public boolean addTicket(TicketInfo ticket);

	/**
	 * This method retrieve all the tickets existed in the database.
	 * 
	 * @return
	 */
	public List<TicketInfo> displayAllTickets();

	/**
	 * This adds the updated ticket information to the database.
	 * 
	 * @param ticket
	 * @return
	 */
	public boolean processTicket(TicketInfo ticket);

	/**
	 * This method get all the states present in the Database and send to the
	 * service class.
	 * 
	 * @return
	 */
	public List<Map<String, Object>> getStates();

	/**
	 * This method retrieve all the category data from DB.
	 * 
	 * @return
	 */
	public List<Map<String, Object>> getCategoriesList();

	/**
	 * This method retrieve all the sub category data based on the category
	 * provided.
	 * 
	 * @param categoryValue
	 * @return
	 */
	public List<Map<String, Object>> getSubCategoriesList(String categoryValue);

}
