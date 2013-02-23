package me.rafaelvargas

import grails.plugins.springsecurity.Secured

class HomeController {
	
	def utilsService
	
    def index() {
		def usersNotGone = User.findAllNotGone([sort:'username',order:'asc'])
		def usersGone = User.findAllGone([sort:'lastTime',order:'desc'])
		
		[usersNotGone:usersNotGone,usersGone:usersGone]
	}
	
	@Secured(['ROLE_ADMIN'])
	def generate(){
		flash.siguiente = utilsService.nextUser()
		redirect action:'index'
	}
}
