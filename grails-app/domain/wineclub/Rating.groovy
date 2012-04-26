package wineclub

import java.util.Date;

class Rating {

	static belongsTo = [wine:Wine]
	
	double value
	Comment comment
	Date dateCreated
	Date lastUpdated

}
