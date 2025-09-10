library(plumber)
library(mongolite)
library(jsonlite)

# Define a plumber router
pr <- Plumber$new()

# Connect to the MongoDB collection
mongo_conn <- mongo(collection = "cv_data", db = "cv_database", url = "mongodb://localhost")

# Define an endpoint to get CV data
pr$handle("GET", "/cv", function() {
    data <- mongo_conn$find('{}')
    return(data)
})

# Define an endpoint to add CV data
pr$handle("POST", "/cv", function(req) {
    data <- fromJSON(req$postBody)
    mongo_conn$insert(data)
    return(list(message = "Data inserted successfully"))
})

# Define an endpoint to update CV data
pr$handle("PUT", "/cv", function(req) {
    data <- fromJSON(req$postBody)
    mongo_conn$update(
        query = toJSON(list(`_id` = mongo_conn$oid(data$id))),
        update = toJSON(list('$set' = list(
            Name = data$Name,
            Email = data$Email,
            Education = data$Education,
            Experience = data$Experience,
            Skills = data$Skills
        )))
    )
    return(list(message = "Data updated successfully"))
})

# Define an endpoint to delete CV data
pr$handle("DELETE", "/cv", function(req) {
    data <- fromJSON(req$postBody)
    mongo_conn$remove(query = toJSON(list(`_id` = mongo_conn$oid(data$id))))
    return(list(message = "Data deleted successfully"))
})

# Run the plumber API
pr$run(port = 8000)
