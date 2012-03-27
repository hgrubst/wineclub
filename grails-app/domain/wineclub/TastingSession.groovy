package wineclub

class TastingSession {

    static constraints = {
    }
    
    static hasMany = [wine:Wine]
    
    Date date
    
    String toString(){
    	return "Session of the " + date.format("dd MMMM yyyy")
    }
}
