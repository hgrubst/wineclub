package wineclub

class TastingSession {

    static constraints = {
    }
    
    static hasMany = [wines:Wine, comment:Comment]
    
	String location
    Date date
    
    String toString(){
    	return "Session of the " + date.format("dd MMMM yyyy")
    }
}
