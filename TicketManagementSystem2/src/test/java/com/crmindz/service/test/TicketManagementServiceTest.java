package com.crmindz.service.test;

import static org.mockito.Mockito.when;

import java.util.ArrayList;
import java.util.List;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.runners.MockitoJUnitRunner;

import com.crmindz.dao.TicketManagementDaoImpl;
import com.crmindz.model.Login;
import com.crmindz.model.Ticket;
import com.crmindz.service.TicketManagementService;

@RunWith(MockitoJUnitRunner.class)
public class TicketManagementServiceTest {
	@InjectMocks
	private TicketManagementService ticketManaementService;
	
	@Mock
	private TicketManagementDaoImpl ticketManagementDaoImpl;
	
	@Test
	public void validateLoginTest()
	{
		List<Login> loginDetails = new ArrayList<Login>();
		Login login = new Login();
		login.setEmail("s@mail.com");
		login.setPassword("s");
		login.setLoginId("19");
		login.setUserType("student");
		loginDetails.add(login);
		when(ticketManagementDaoImpl.getLoginDetails(Mockito.any(Login.class))).thenReturn(loginDetails);
		Login loginCredentials = new Login();
		loginCredentials.setEmail("s@mail.com");
		loginCredentials.setLoginId("19");
		loginCredentials.setPassword("s");
		loginCredentials.setUserType("student");
		Assert.assertEquals(loginDetails,ticketManaementService.validateLogin(loginCredentials));
	}
	
	
	@Test
	public void displayTicketsTest()
	{
		Ticket ticket = new Ticket();
		ticket.setSessionAttribute("19");
		
		
		Ticket ticket1 = new Ticket();
		ticket1.setTicketNumber("Q5SBWT5N3T");
		ticket1.setTcategory("Mouse");
		ticket1.setTsubcategory("Battery");
		ticket1.setTdescription("problem with Battery");
		ticket1.setTstatus("pending");
		ticket1.setComments("");
		ticket1.setSessionAttribute("19");
		
		Ticket ticket2 = new Ticket();
		ticket2.setTicketNumber("VSDT29WG7E");
		ticket2.setTcategory("PC");
		ticket2.setTsubcategory("OS");
		ticket2.setTdescription("problem with OS");
		ticket2.setTstatus("approved");
		ticket2.setComments("Formatted the PC");
		ticket2.setSessionAttribute("19");
		
		List<Ticket> listOfTickets = new ArrayList<Ticket>();
		listOfTickets.add(ticket1);
		listOfTickets.add(ticket2);
		
		when(ticketManagementDaoImpl.displayTicketData(Mockito.any(Ticket.class))).thenReturn(listOfTickets);
		Assert.assertEquals(listOfTickets,ticketManaementService.displayTicketsByID(ticket));
	}
	
	@Test
	public void addTicketTest()
	{
		Ticket ticket = new Ticket();
		ticket.setTicketNumber("Q5SBWT5N3T");
		ticket.setTcategory("Mouse");
		ticket.setTsubcategory("Battery");
		ticket.setTdescription("problem with Battery");
		ticket.setTstatus("pending");
		ticket.setComments("");
		ticket.setSessionAttribute("19");
		when(ticketManagementDaoImpl.addTicket(Mockito.any(Ticket.class))).thenReturn(true);
		Assert.assertEquals(true,ticketManaementService.addTicket(ticket));
	}
	
	
	
	
}
