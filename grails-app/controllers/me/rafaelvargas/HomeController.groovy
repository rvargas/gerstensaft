package me.rafaelvargas

import grails.plugins.springsecurity.Secured

class HomeController {
	
	def utilsService
	
    def index() {
		def usersNotGone = User.findAllNotGone()
		def usersGone = User.findAllGone([sort:'lastTime',order:'asc'])
		
		[usersNotGone:usersNotGone,usersGone:usersGone]
	}
	
	@Secured(['ROLE_ADMIN'])
	def generate(){
		flash.siguiente = utilsService.nextUser()
		redirect action:'index'
	}
}
