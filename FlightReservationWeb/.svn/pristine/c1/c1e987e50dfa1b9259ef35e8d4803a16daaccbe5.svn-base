package com.bcj.flightticket.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.bcj.flightticket.modal.Customer;
import com.bcj.flightticket.modal.CreditCard;
import com.bcj.flightticket.util.DBUtil;

public class FlightTicketDao {
	Connection con = DBUtil.getConnection();

	public CreditCard referenceData(Customer cust) {
		CreditCard pd = new CreditCard();
		try {
			PreparedStatement pst;
			pst = con.prepareStatement("select * from creditreferencedata where card_number=?");
			pst.setString(1, cust.getCreditCard().getCardNumber());
			ResultSet rs = pst.executeQuery();

			while (rs.next()) {
				pd.setCardNumber(rs.getString("card_number"));
				pd.setNameOnCard(rs.getString("name_on_card"));
				pd.setCvv(rs.getString("cvv"));
				pd.setExpireDate(rs.getString("expiry_date"));
				pd.setAvailableBalance(rs.getString("available_balance"));
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return pd;

	}

	public void addCustomerData(Customer cust) {
		  //customer Table
		
		try {
			PreparedStatement pst2;
			pst2 = con.prepareStatement("insert into customer (firstname,lastname, email, phone)" + "values(?,?,?,?)",PreparedStatement.RETURN_GENERATED_KEYS);
			pst2.setString(1, cust.getFirstName());
			pst2.setString(2, cust.getLastName());
			pst2.setString(3, cust.getEmailID());
			pst2.setString(4, cust.getPhoneNumber());
			int count = pst2.executeUpdate();
			System.out.println("no of rows effected in Customer Table:" + count);
			
			ResultSet rs = pst2.getGeneratedKeys();
			while(rs.next())
			{
				cust.setCustomerID(rs.getInt(1));
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		//user Table

		try {
			PreparedStatement pst3;
			pst3 = con.prepareStatement("insert into login (user_name,password,customer_customer_id) values(?,?,?)",PreparedStatement.RETURN_GENERATED_KEYS);
			pst3.setString(1, cust.getUser().getUserName());
			pst3.setString(2, cust.getUser().getPassword());
			pst3.setInt(3, cust.getCustomerID());
			int count = pst3.executeUpdate();
			System.out.println("no of rows effected in User table:" + count);
			ResultSet rs = pst3.getGeneratedKeys();
			while(rs.next())
			{
				cust.getUser().setUserID((rs.getInt(1)));
			}
			rs.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		//address Table

		try {
			PreparedStatement pst4;
			pst4 = con.prepareStatement("insert into address (address_line1,address_line2,city,state,zip,customer_customer_id)"+"values(?,?,?,?,?,?)", PreparedStatement.RETURN_GENERATED_KEYS);
			
			pst4.setString(1, cust.getAddress().getAddressLine1());
			pst4.setString(2, cust.getAddress().getAddressLine2());
			pst4.setString(3, cust.getAddress().getCity());
			pst4.setString(4, cust.getAddress().getState());
			pst4.setString(5, cust.getAddress().getZip());
			pst4.setInt(6, cust.getCustomerID());
			pst4.executeUpdate();
			System.out.println("Address saved");
			ResultSet rs = pst4.getGeneratedKeys();
			while(rs.next())
			{
				cust.getAddress().setAddressId((rs.getInt(1)));
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		//bookinginfo Table
		try
		{
			PreparedStatement pst5;
			pst5 = con.prepareStatement("insert into booking(itenary_id,booking_reference,fare,customer_customer_id) values(?,?,?,?)",PreparedStatement.RETURN_GENERATED_KEYS);
			pst5.setString(1, cust.getBookingInfo().getItenaryID());
			pst5.setInt(2, cust.getBookingInfo().getbRefNumber());
			pst5.setString(3, cust.getBookingInfo().getFare());
			pst5.setInt(4, cust.getCustomerID());
			pst5.executeUpdate();
			System.out.println("bookinginfo saved");
			ResultSet rs = pst5.getGeneratedKeys();
			while(rs.next())
			{
				cust.getBookingInfo().setBookingId((rs.getInt(1)));
			}
			rs.close();
			
		}catch(SQLException e)
		{
			e.printStackTrace();
		}
		
		
		//ticket table
		try
		{
			PreparedStatement pst6;
			pst6=con.prepareStatement("insert into ticket(departure,destination,travel_date,travel_type,booking_booking_id)  values(?,?,?,?,?)");
			pst6.setString(1, cust.getBookingInfo().getTicket().getDeparture());
			pst6.setString(2, cust.getBookingInfo().getTicket().getDestination());
			pst6.setString(3, cust.getBookingInfo().getTicket().getTravelDate());
			pst6.setString(4, cust.getBookingInfo().getTicket().getTravelType());
			pst6.setInt(5, cust.getBookingInfo().getBookingId());
			pst6.executeUpdate();
			
			if("roundtrip".equals(cust.getBookingInfo().getTicket().getTravelType()));
			PreparedStatement rtpst;
			rtpst=con.prepareStatement("insert into ticket(departure,destination,travel_date,travel_type,booking_booking_id)  values(?,?,?,?,?)");
			rtpst.setString(1, cust.getBookingInfo().getTicket().getReturnDeparture());
			rtpst.setString(2, cust.getBookingInfo().getTicket().getReturnDestination());
			rtpst.setString(3, cust.getBookingInfo().getTicket().getReturnTravelDate());
			rtpst.setString(4, cust.getBookingInfo().getTicket().getTravelType());
			rtpst.setInt(5, cust.getBookingInfo().getBookingId());
			rtpst.executeUpdate();
			
			System.out.println("ticket generated");
		} catch(SQLException e)
		{
			e.printStackTrace();
		}
		

	}

	public void saveCC(Customer cust) {
		try {
			PreparedStatement pst7;
			pst7 = con.prepareStatement("insert into savedcredentials(card_number,name_on_card,cvv,expiry_date,customer_customer_id)  values(?,?,?,?,?)");
			pst7.setString(1, cust.getCreditCard().getCardNumber());
			pst7.setString(2, cust.getCreditCard().getNameOnCard());
			pst7.setString(3, cust.getCreditCard().getCvv());
			pst7.setString(4, cust.getCreditCard().getExpireDate());
			pst7.setInt(5, cust.getCustomerID());
			pst7.executeUpdate();
			System.out.println("card saved into DB");
			
		} catch(SQLException e)
		{
			e.printStackTrace();
		}
		
	}
	
	
	
}
