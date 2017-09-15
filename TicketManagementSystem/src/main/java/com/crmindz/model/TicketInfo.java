package com.crmindz.model;

/**
 * @author SivaramaKrishnaLinga
 *
 */
public class TicketInfo {
	private String ticketNumber;
	private String tcategory;
	private String tsubcategory;
	private String tdescription;
	private String sessionAttribute;
	private String tstatus;
	private String comments;

	/**
	 * @return the ticketNumber
	 */
	public String getTicketNumber() {
		return ticketNumber;
	}

	/**
	 * @param ticketNumber the ticketNumber to set
	 */
	public void setTicketNumber(String ticketNumber) {
		this.ticketNumber = ticketNumber;
	}

	/**
	 * @return the tcategory
	 */
	public String getTcategory() {
		return tcategory;
	}

	/**
	 * @param tcategory the tcategory to set
	 */
	public void setTcategory(String tcategory) {
		this.tcategory = tcategory;
	}

	/**
	 * @return the tsubcategory
	 */
	public String getTsubcategory() {
		return tsubcategory;
	}

	/**
	 * @param tsubcategory the tsubcategory to set
	 */
	public void setTsubcategory(String tsubcategory) {
		this.tsubcategory = tsubcategory;
	}

	/**
	 * @return the tdescription
	 */
	public String getTdescription() {
		return tdescription;
	}

	/**
	 * @param tdescription the tdescription to set
	 */
	public void setTdescription(String tdescription) {
		this.tdescription = tdescription;
	}

	/**
	 * @return the sessionAttribute
	 */
	public String getSessionAttribute() {
		return sessionAttribute;
	}

	/**
	 * @param sessionAttribute the sessionAttribute to set
	 */
	public void setSessionAttribute(String sessionAttribute) {
		this.sessionAttribute = sessionAttribute;
	}

	/**
	 * @return the tstatus
	 */
	public String getTstatus() {
		return tstatus;
	}

	/**
	 * @param tstatus the tstatus to set
	 */
	public void setTstatus(String tstatus) {
		this.tstatus = tstatus;
	}

	/**
	 * @return the comments
	 */
	public String getComments() {
		return comments;
	}

	/**
	 * @param comments the comments to set
	 */
	public void setComments(String comments) {
		this.comments = comments;
	}

	@Override
	public String toString() {
		return "Ticket [ticketNumber=" + ticketNumber + ", tcategory=" + tcategory + ", tsubcategory=" + tsubcategory
				+ ", tdescription=" + tdescription + ", sessionAttribute=" + sessionAttribute + ", tstatus=" + tstatus
				+ ", comments=" + comments + "]";
	}
}
