package wineclub

class Rating {

	static belongsTo = [wine:Wine]
	
	double value
	Comment comment
}
