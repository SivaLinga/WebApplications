package com.bcj.flightticket.service;

import java.util.Random;

import com.bcj.flightticket.dao.FlightTicketDao;
import com.bcj.flightticket.modal.Customer;
import com.bcj.flightticket.modal.CreditCard;

public class FlightTicketService {
	FlightTicketDao rd = new FlightTicketDao();

	public String verifyPayment(Customer cust) {
		CreditCard pds = rd.referenceData(cust);
		if (pds.getCardNumber().equals(cust.getCreditCard().getCardNumber())
				&& pds.getNameOnCard().equals(cust.getCreditCard().getNameOnCard())
				&& pds.getCvv().equals(cust.getCreditCard().getCvv())
				&& pds.getExpireDate().equals(cust.getCreditCard().getExpireDate())) {
			if (Integer.parseInt(pds.getAvailableBalance()) > Integer.parseInt(cust.getBookingInfo().getFare())) {
				return "Success";
			} else
				return "Insufficient Balance";
		} else {
			return "Invalid Credentials";
		}
	}
	
	
	public void generateTicket(Customer cust) {
		rd.addCustomerData(cust);
	}

	public String generateItinerary() {
		int leftLimit = 65;
		int rightLimit = 90;
		int targetStringLength = 6;
		Random random = new Random();
		StringBuilder builder = new StringBuilder(targetStringLength);
		for (int i = 0; i < targetStringLength; i++) {
			int randomLimitedInt = leftLimit + (int) (random.nextFloat() * (rightLimit - leftLimit + 1));
			builder.append((char) randomLimitedInt);
		}
		String itinerary = builder.toString();
		return itinerary;
	}

	public int generateFlightBookingReference() {
		Random rand = new Random();
		int randNumber = rand.nextInt(10000);
		return randNumber;
	}


	public void saveCC(Customer cust) {
		rd.saveCC(cust);
	}
}
