package me.rafaelvargas

class UtilsService {

    String nextUser(Integer count) {
		def usersNotGone = User.findAllNotGone()
		def userNotGoneCount = usersNotGone.size
		
		def userSelected
		
		if(userNotGoneCount > 1){
			userSelected = usersNotGone[calculate(userNotGoneCount)]
			markUser(userSelected)
			
		}
		else{
			userSelected = usersNotGone.first()
			markUser(userSelected)
			cleanUsers()
		}
		
		sendMail(userSelected)
		
		return userSelected.username
    }
	
	protected Integer calculate(Integer max){
		def random = new Random()
		return random.nextInt(max)
	}
	
	protected void cleanUsers(){
		def userList = User.list()
		
		userList.each{
			it.gone = false
			it.save(flush:true)
		}
		
		auditActivity('Limpieza de valores')
	}
	
	protected void markUser(User user){
		user.gone = true
		user.lastTime = new Date()
		user.save(flush:true)
		
		auditActivity(user,'Usuario seleccionado')
	}
	
	protected void auditActivity(User user, String activity){
		def newAuditLog = new AuditLog(user:user,activity:activity).save(flush:true)
	}
	
	protected void auditActivity(String activity){
		def newAuditLog = new AuditLog(activity:activity).save(flush:true)
	}
	
	protected void sendMail(User user){
		
		def allUsers = User.list()
		def usersMail = []
		
		allUsers.each {
			usersMail.add(it.username + "@manoderecha.mx")
		}
		
		sendMail {
			to "mr.gerstensaft@gmail.com"
			bcc usersMail
			subject "Le toca a ${user.username}"
			body "Aprovechen."
		}
	}
	
}
