package com.crmindz.model;

public class Ticket {
	private String ticketNumber;
	private String tcategory;
	private String tsubcategory;
	private String tdescription;
	//private Number sessionAttribute;
	private String sessionAttribute;
	private String tstatus;
	private String comments;
	
	
	@Override
	public String toString() {
		return "Ticket [ticketNumber=" + ticketNumber + ", tcategory=" + tcategory + ", tsubcategory=" + tsubcategory
				+ ", tdescription=" + tdescription + ", sessionAttribute=" + sessionAttribute + ", tstatus=" + tstatus
				+ ", comments=" + comments + "]";
	}
	public String getSessionAttribute() {
		return sessionAttribute;
	}
	public void setSessionAttribute(String sessionAttribute) {
		this.sessionAttribute = sessionAttribute;
	}
	
	public String getTstatus() {
		return tstatus;
	}
	public void setTstatus(String tstatus) {
		this.tstatus = tstatus;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	
	public String getTcategory() {
		return tcategory;
	}
	public void setTcategory(String tcategory) {
		this.tcategory = tcategory;
	}
	public String getTsubcategory() {
		return tsubcategory;
	}
	public void setTsubcategory(String tsubcategory) {
		this.tsubcategory = tsubcategory;
	}
	public String getTdescription() {
		return tdescription;
	}
	public void setTdescription(String tdescription) {
		this.tdescription = tdescription;
	}
	public String getTicketNumber() {
		return ticketNumber;
	}
	public void setTicketNumber(String ticketNumber) {
		this.ticketNumber = ticketNumber;
	}

}
