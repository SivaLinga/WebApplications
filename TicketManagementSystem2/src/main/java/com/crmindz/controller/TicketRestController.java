package com.crmindz.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.crmindz.model.Ticket;
import com.crmindz.service.TicketRestService;

@RestController
public class TicketRestController {
	@Autowired
	TicketRestService ticketRestService;
	
	@RequestMapping(value = "/getTickets/{id}" )
	public List<Ticket> getTicketsById(ModelMap model, @PathVariable("id") String id) {
		List<Ticket> pendingTickets = ticketRestService.getTicketsById(id);
		return pendingTickets;
	}
}