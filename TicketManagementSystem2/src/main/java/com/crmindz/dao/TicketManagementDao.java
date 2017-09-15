package com.crmindz.dao;

import java.util.List;
import java.util.Map;

import com.crmindz.model.Login;
import com.crmindz.model.Ticket;
import com.crmindz.model.User;

/**
 * @author SivaramaKrishnaLinga In this Interface, it has all the methods which
 *         are required to interact with the database either to insert into
 *         database or to retrieve the data from the database. Based on the
 *         provided parameters in the method, retrieve data from DB and send it
 *         to the service class.
 */
public interface TicketManagementDao {

	/**
	 * This method retrieve emailid from the login table in the database
	 * 
	 * @param user
	 * @return
	 */
	public List<Login> retrieveEmail(User user);

	/**
	 * This method add the registration data to the database.
	 * 
	 * @param user
	 * @return
	 */
	public boolean register(User user);

	/**
	 * This method retrieve login details from the DB based on the email provided by
	 * the user.
	 * 
	 * @param login
	 * @return
	 */
	public List<Login> getLoginDetails(Login login);

	/**
	 * This method retrieve tickets created by the user from the database.
	 * 
	 * @param ticket
	 * @return
	 */
	public List<Ticket> displayTicketData(Ticket ticket);

	/**
	 * This method add the created ticket information to the database.
	 * 
	 * @param ticket
	 * @return
	 */
	public boolean addTicket(Ticket ticket);

	/**
	 * This method retrieve all the tickets existed in the database.
	 * 
	 * @return
	 */
	public List<Ticket> displayAll();

	/**
	 * This adds the updated ticket information to the database.
	 * 
	 * @param ticket
	 * @return
	 */
	public boolean processTicket(Ticket ticket);

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
