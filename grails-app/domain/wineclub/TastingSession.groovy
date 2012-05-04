package wineclub

class TastingSession {

    static constraints = {
    }

    static mapping = {
        comments joinTable: false
    }
    
    static hasMany = [wines:Wine, comments:Comment]
    
	String location
    Date date
    
    String toString(){
    	return "Session of the " + date.format("dd MMMM yyyy")
    }
}
