package wineclub

class ImageController {

    def show() { 
        def image = Image.get(params.id)
                             
		println "image/${image.extension}"
          
		response.contentType="image/${image.extension}"
        response.outputStream << image.bytes
    
    }
}
