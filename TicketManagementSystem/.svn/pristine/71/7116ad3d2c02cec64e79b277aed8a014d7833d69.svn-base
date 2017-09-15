package com.crmindz.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.crmindz.model.LoginInfo;
import com.crmindz.model.TicketInfo;
import com.crmindz.model.UserInfo;

/**
 * @author SivaramaKrishnaLinga
 *
 */
@Repository
public class TicketManagementDaoImpl implements TicketManagementDao {

	@Autowired
	JdbcTemplate jdbcTemplate;

	@Override
	public List<LoginInfo> retrieveEmail(UserInfo user) {
		String query = "select email from login where email= ?";
		Object[] args = new Object[] { user.getLogin().getEmail() };

		List<LoginInfo> emailVerificationList = jdbcTemplate.query(query, args, new RowMapper<LoginInfo>() {
			@Override
			public LoginInfo mapRow(ResultSet rs, int rowNum) throws SQLException {
				LoginInfo emailVerification = new LoginInfo();
				emailVerification.setEmail(rs.getString("email"));
				return emailVerification;
			}
		});
		return emailVerificationList;
	}

	@Override
	public boolean registerUser(UserInfo user) {

		boolean registrationStatus = false;
		String query0 = "insert into login (email, password, user_type) values(?,?,?)";
		Object[] args0 = new Object[] { user.getLogin().getEmail(), user.getLogin().getPassword(),
				user.getLogin().getUserType() };
		// if the data entered into the login table properly
		if (0 != jdbcTemplate.update(query0, args0)) {
			System.out.println("Login Details are inserted");
			String query1 = "select login_id from login where email=? && password=? && user_type=?";
			// retrieve login id from the database
			String loginId = jdbcTemplate.queryForObject(query1, new Object[] { user.getLogin().getEmail(),
					user.getLogin().getPassword(), user.getLogin().getUserType() }, String.class);
			if (null != loginId) {
				user.getLogin().setLoginId(loginId);
				System.out.println("Login Id is " + user.getLogin().getLoginId());
				// insert data into the user table
				String query2 = "insert into user (first_name, last_name, phone, login_login_id) values(?,?,?,?)";
				Object[] args1 = new Object[] { user.getFirstName(), user.getLastName(), user.getPhone(),
						user.getLogin().getLoginId() };
				// if the data entered into the user table properly
				if (0 != jdbcTemplate.update(query2, args1)) {

					String query3 = "select user_id from user where login_login_id=?";
					int userId = jdbcTemplate.queryForObject(query3, new Object[] { user.getLogin().getLoginId() },
							Integer.class);
					System.out.println("User Id from DB =" + userId);

					if (0 != userId) {
						user.setUserId(userId);
						// enter data into the address table
						String query4 = "insert into address (addressLine1, addressLine2, city, state, zip, user_user_id) values(?,?,?,?,?,?)";
						Object[] args2 = new Object[] { user.getAddress().getAddressLine1(),
								user.getAddress().getAddressLine2(), user.getAddress().getCity(),
								user.getAddress().getState(), user.getAddress().getZip(), user.getUserId() };
						if (0 != jdbcTemplate.update(query4, args2)) {
							System.out.println("Address is inserted");
							registrationStatus = true;
						} else {
							System.out.println("Problem in Entering Address Details into DB");
						}
					} else {
						System.out.println("Unable to retrieve User Id from DB");
					}

				} else {
					System.out.println("Problem in Entering Personal Details into DB");
				}
			} else {
				System.out.println("Unable to retrieve Login ID from DB");
			}

		} else {
			System.out.println("problem in Entering Login Details into DB");
		}

		return registrationStatus;
	}

	@Override
	public List<LoginInfo> getLoginDetails(LoginInfo login) {
		String sql = "select login_id, email, password, user_type from login where email=?";
		Object[] args = new Object[] { login.getEmail() };
		List<LoginInfo> loginDetailsfromDb = jdbcTemplate.query(sql, args, new RowMapper<LoginInfo>() {

			@Override
			public LoginInfo mapRow(ResultSet rs, int rowNum) throws SQLException {
				LoginInfo loginDetails = new LoginInfo();
				loginDetails.setLoginId(rs.getString("login_id"));
				loginDetails.setEmail(rs.getString("email"));
				loginDetails.setPassword(rs.getString("password"));
				loginDetails.setUserType(rs.getString("user_type"));
				return loginDetails;
			}

		});
		return loginDetailsfromDb;
	}

	@Override
	public List<TicketInfo> displayTicketDataByID(TicketInfo ticket) {
		String query = "select ticketnumber, category, subcategory, description, status,comments from ticket where login_login_id=?";
		Object args[] = new Object[] { ticket.getSessionAttribute() };
		List<Map<String, Object>> ticketData = jdbcTemplate.queryForList(query, args);
		List<TicketInfo> listOfTickets = new ArrayList<TicketInfo>();
		for (Map<String, Object> map : ticketData) {
			TicketInfo ticketObj = new TicketInfo();
			ticketObj.setTicketNumber((String) map.get("ticketnumber"));
			ticketObj.setTcategory((String) map.get("category"));
			ticketObj.setTsubcategory((String) map.get("subcategory"));
			ticketObj.setTdescription((String) map.get("description"));
			ticketObj.setTstatus((String) map.get("status"));
			ticketObj.setComments((String) map.get("comments"));
			listOfTickets.add(ticketObj);
		}
		return listOfTickets;
	}

	@Override
	public boolean addTicket(TicketInfo ticket) {
		String query = "insert into ticket (ticketnumber, category, subcategory, description, status, login_login_id ) values (?,?,?,?,?,?)";
		Object args[] = new Object[] { ticket.getTicketNumber(), ticket.getTcategory(), ticket.getTsubcategory(),
				ticket.getTdescription(), ticket.getTstatus(), ticket.getSessionAttribute() };
		int update = jdbcTemplate.update(query, args);
		if (update != 0) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public List<TicketInfo> displayAllTickets() {

		String query = "select * from ticket";
		List<Map<String, Object>> ticketData = jdbcTemplate.queryForList(query);
		List<TicketInfo> listOfTickets = new ArrayList<TicketInfo>();
		for (Map<String, Object> map : ticketData) {
			TicketInfo ticketObj = new TicketInfo();
			ticketObj.setTicketNumber((String) map.get("ticketnumber"));
			ticketObj.setTcategory((String) map.get("category"));
			ticketObj.setTsubcategory((String) map.get("subcategory"));
			ticketObj.setTdescription((String) map.get("description"));
			ticketObj.setTstatus((String) map.get("status"));
			ticketObj.setComments((String) map.get("comments"));
			listOfTickets.add(ticketObj);
		}
		return listOfTickets;
	}

	@Override
	public boolean processTicket(TicketInfo ticket) {
		String query = "update ticket set status = ?, comments = ? where ticketnumber=?";
		Object[] args = new Object[] { ticket.getTstatus(), ticket.getComments(), ticket.getTicketNumber() };
		if (0 != jdbcTemplate.update(query, args)) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public List<Map<String, Object>> getStates() {
		String query = "select state_name from states";
		List<Map<String, Object>> states = jdbcTemplate.queryForList(query);
		return states;
	}

	@Override
	public List<Map<String, Object>> getCategoriesList() {
		String query = "select category_name from categories";
		List<Map<String, Object>> categories = jdbcTemplate.queryForList(query);
		return categories;
	}

	@Override
	public List<Map<String, Object>> getSubCategoriesList(String categoryValue) {
		String query = "select category_id from categories where category_name=? ";
		int category_id = jdbcTemplate.queryForObject(query, new Object[] { categoryValue }, Integer.class);

		String query1 = "select subcategory_name from subcategories where categories_category_id=?";
		List<Map<String, Object>> subcategories = jdbcTemplate.queryForList(query1, new Object[] { category_id });
		return subcategories;
	}

}
