package wineclub

class Wine {

    static constraints = {
    }
    
    String name
    String type
    String region
    String year
    Double rating
    
    TastingSession tastingSession
    
    String toString(){
    	name + " " + year
    }
}
