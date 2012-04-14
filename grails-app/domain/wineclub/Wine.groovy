package wineclub

class Wine {

	static constraints = {
		name()
		grape()
		region()
		year()
	}

	static hasMany = [rating:Rating]

	String name
	String grape
	String region
	String year

	TastingSession tastingSession

	String toString(){
		name + " " + year
	}
}
