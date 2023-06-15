library(jsonlite)
count <- 30
id_min <- 0
id_max <- 10000
values_keep_full <- c(0, 0.5, 0.75)
values_fullness_decrease <- c(3, 2, 1.5)
agent_ids <- sample(id_min:id_max, count, replace = FALSE)


json_keep_full <- '{
        "actor": "PERSON",
        "id": 0,
        "steps": 13248,
        "operator": "MULTIPLY",
        "fieldName": "keepingFullTimeInMinutes",
        "value": "0",
        "accessors": [
          {
            "manipulationType": "FIELD",
            "name": "foodNeed"
          }
        ]
    }'

json__fullness_decrease <- '{
        "actor": "PERSON",
        "id": 0,
        "steps": 13248,
        "operator": "MULTIPLY",
        "fieldName": "fullnessDecreasePerStep",
        "value": "0",
        "accessors": [
          {
            "manipulationType": "FIELD",
            "name": "foodNeed"
          }
        ]
    }'

data_keep_full <- fromJSON(json_keep_full)
data_fullness_decrease <- fromJSON(json__fullness_decrease)

print(values_keep_full)
cat("[", "\n")
for (i in seq(1, count, 3)) {
    data_keep_full$id <- agent_ids[i]
    data_keep_full$value <- values_keep_full[1]
    cat(toJSON(data_keep_full, auto_unbox = TRUE), ",", "\n")

    data_keep_full$id <- agent_ids[i + 1]
    data_keep_full$value <- values_keep_full[2]
    cat(toJSON(data_keep_full, auto_unbox = TRUE), ",", "\n")

    data_keep_full$id <- agent_ids[i + 2]
    data_keep_full$value <- values_keep_full[3]
    cat(toJSON(data_keep_full, auto_unbox = TRUE), ",", "\n")
}
cat("]\n")



print(values_fullness_decrease)

cat("[", "\n")
for (i in seq(1, count, 3)) {
    data_fullness_decrease$id <- agent_ids[i]
    data_fullness_decrease$value <- values_fullness_decrease[1]
    cat(toJSON(data_fullness_decrease, auto_unbox = TRUE), ",", "\n")

    data_fullness_decrease$id <- agent_ids[i + 1]
    data_fullness_decrease$value <- values_fullness_decrease[2]
    cat(toJSON(data_fullness_decrease, auto_unbox = TRUE), ",", "\n")

    data_fullness_decrease$id <- agent_ids[i + 2]
    data_fullness_decrease$value <- values_fullness_decrease[3]
    cat(toJSON(data_fullness_decrease, auto_unbox = TRUE), ",", "\n")
}
cat("]\n")
