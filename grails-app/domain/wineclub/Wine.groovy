package wineclub

class Wine {

	static constraints = {
		name(blank:false)
		grape()
		region()
		year()
		tastingSession nullable:true
	}

	static mapping = {
		ratings sort: 'dateCreated', order: 'asc'
	}
	
	static hasMany = [ratings:Rating]

	String name
	String grape
	String region
	String year

	TastingSession tastingSession

	String toString(){
		name + " " + year
	}
}
