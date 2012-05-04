package wineclub

import java.util.Date;

class Wine {

	static constraints = {
		name(blank:false)
		grape()
		region()
		year()
		tastingSession nullable:true
		image nullable:true
	}

	static mapping = {
		ratings sort: 'dateCreated', order: 'asc'
	}
	
	static hasMany = [ratings:Rating]

	String name
	String grape
	String region
	String year
	Image image
	Date dateCreated
	Date lastUpdated


	TastingSession tastingSession

	String toString(){
		name + " " + year
	}
}
