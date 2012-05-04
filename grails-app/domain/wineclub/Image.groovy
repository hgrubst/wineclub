package wineclub

class Image {

    static constraints = {
		bytes maxSize: 1024 * 1024 * 2
    }      

	static belongsTo = Wine
    
    String fullName
	String extension
	byte[] bytes
	Date dateCreated
	Date lastUpdated

}
