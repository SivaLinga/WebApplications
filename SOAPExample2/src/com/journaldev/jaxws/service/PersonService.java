package com.journaldev.jaxws.service;

import com.journaldev.jaxws.beans.Person;

public interface PersonService {
	
	public boolean addPerson(Person p);
	public Person getPerson(int id);
}
