class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

		"/"(controller:"tastingSession", action:"list")
		"500"(view:'/error')
	}
}
