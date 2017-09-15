package com.journaldev.jaxws.service;

import java.util.HashMap;
import java.util.Map;

import com.journaldev.jaxws.beans.Person;

public class PersonServiceImpl implements PersonService {
	private static Map<Integer,Person> persons = new HashMap<Integer,Person>();
	@Override
	public boolean addPerson(Person p) {
		if(persons.get(p.getId()) != null) return false;
		persons.put(p.getId(), p);
		return true;
	}

	@Override
	public Person getPerson(int id) {
		return persons.get(id);
	}
	
}
