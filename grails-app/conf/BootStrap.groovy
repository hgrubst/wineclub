import wineclub.Comment
import wineclub.Rating
import wineclub.Wine

class BootStrap {

    def init = { servletContext ->
		
		def wine = new Wine()
		wine.grape = "Shiraz"
		wine.year = "2009"
		wine.region="Barossa"
		wine.name="PepperJack" 
		wine.save(failOnError: true)
	
		wine.addToRatings(new Rating(value:13,comment:new Comment(text:"this is a comment")))
		
		
		def wine2 = Wine.get(wine.id)
		wine2.addToRatings(new Rating(value:15,comment:new Comment(text:"this is a comment")))
		
//		new Comment(text:"single comment with no rating associated1").save()	
    }
    def destroy = {
    }
}
