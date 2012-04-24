package wineclub

class Comment {

	static constraints = {
	}

	//need to specify this to ensure the cascading from Rating works properly
	static belongsTo = Rating
	
	String text
	Date dateCreated
	Date lastUpdated
}
