package com.crmindz.service;

import java.util.ArrayList;
import java.util.List;

import javax.jws.WebMethod;
import javax.jws.WebService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import com.crmindz.dao.TicketManagementDaoImpl;
import com.crmindz.model.Ticket;

@WebService
public class TicketSoapService {
	@Autowired
	TicketManagementDaoImpl ticketManagementDaoImpl;
	
	@WebMethod
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