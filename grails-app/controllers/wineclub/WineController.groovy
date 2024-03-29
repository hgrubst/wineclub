package wineclub

import org.springframework.dao.DataIntegrityViolationException

class WineController {

	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def index() {
		redirect(action: "list", params: params)
	}

	def list() {
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		[wineInstanceList: Wine.list(params), wineInstanceTotal: Wine.count()]
	}

	def create() {
		[wineInstance: new Wine(params)]
	}

	def save() {
		def wineInstance = new Wine(params)
		if (!wineInstance.save(flush: true)) {
			render(view: "create", model: [wineInstance: wineInstance])
			return
		}

		flash.message = message(code: 'default.created.message', args: [message(code: 'wine.label', default: 'Wine'), wineInstance.id])
		redirect(action: "show", id: wineInstance.id)
	}

	def show() {
		def wineInstance = Wine.get(params.id)
		if (!wineInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'wine.label', default: 'Wine'), params.id])
			redirect(action: "list")
			return
		}

		[wineInstance: wineInstance]
	}

	def edit() {
		def wineInstance = Wine.get(params.id)
		if (!wineInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'wine.label', default: 'Wine'), params.id])
			redirect(action: "list")
			return
		}

		[wineInstance: wineInstance]
	}

	def update() {
		def wineInstance = Wine.get(params.id)
		if (!wineInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'wine.label', default: 'Wine'), params.id])
			redirect(action: "list")
			return
		}

		if (params.version) {
			def version = params.version.toLong()
			if (wineInstance.version > version) {
				wineInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
						[message(code: 'wine.label', default: 'Wine')] as Object[],
						"Another user has updated this Wine while you were editing")
				render(view: "edit", model: [wineInstance: wineInstance])
				return
			}
		}

		wineInstance.properties = params

		if (!wineInstance.save(flush: true)) {
			render(view: "edit", model: [wineInstance: wineInstance])
			return
		}

		flash.message = message(code: 'default.updated.message', args: [message(code: 'wine.label', default: 'Wine'), wineInstance.id])
		redirect(action: "show", id: wineInstance.id)
	}

	def delete() {
		def wineInstance = Wine.get(params.id)
		if (!wineInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'wine.label', default: 'Wine'), params.id])
			redirect(action: "list")
			return
		}

		try {
			wineInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'wine.label', default: 'Wine'), params.id])
			redirect(action: "list")
		}
		catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'wine.label', default: 'Wine'), params.id])
			redirect(action: "show", id: params.id)
		}
	}

	def rate(){
		println "entering WineController.rate"
		
		def wineInstance = Wine.get(params.id)

		def commentTitle = params.title;
		def commentText = params.comment;
		def ratingValue = params.rating;

		def rating = new Rating(value:ratingValue,comment:new Comment(title:commentTitle,text:commentText))
		wineInstance.addToRatings(rating)

		
		if(!wineInstance.save(flush:true)){
			//handle error?
		}

		render(template: "rating", model: [rating: rating])
	}
	
	def uploadImage(){
		def f = request.getFile('bytes')

	    def wineInstance = Wine.get(params.id)
		if(!wineInstance.image){
			wineInstance.image = new Image()			
		}

		println f.originalFilename
		                              
		wineInstance.image.fullName = f.originalFilename
		wineInstance.image.extension = f.originalFilename.substring(f.originalFilename.lastIndexOf(".")+1)
		wineInstance.image.bytes = f.bytes   		
        wineInstance.save(flush:true)
        
		redirect(action: "show", id: params.id)

	}
}