package wineclub

class Comment {

	static constraints = {
		title nullable:false
	}

	//need to specify this to ensure the cascading from Rating works properly
	static belongsTo = Rating
	
	String title
	String text
	Date dateCreated
	Date lastUpdated
}
