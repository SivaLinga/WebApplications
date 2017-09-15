package com.crmindz.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crmindz.dao.TicketManagementDaoImpl;
import com.crmindz.model.Ticket;

@Service
public class TicketRestService {
	@Autowired
	TicketManagementDaoImpl ticketManagementDaoImpl;
	
	
	public List<Ticket> getTicketsById(String id) {
		List<Ticket> ticketsList = new ArrayList<Ticket>();
		List<Ticket> listOfTickets = ticketManagementDaoImpl.displayAll();
		for (Ticket ticket : listOfTickets) {
			if(id.equals(ticket.getTicketNumber()))
			{
				ticketsList.add(ticket);
			}
		}
		return ticketsList;
	}
	
}