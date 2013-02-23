package me.rafaelvargas

class AuditLog {
	
	User user
	String activity
	Date dateCreated
	
    static constraints = {
		user nullable:true,blank:true
    }
}
