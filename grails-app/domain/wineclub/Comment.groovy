package wineclub

class Comment {

	static constraints = {
		title nullable:false
	}

	//enable cascading from Rating but not bidirection
	static belongsTo = Rating
	
	String title
	String text
	Date dateCreated
	Date lastUpdated      
	
}
