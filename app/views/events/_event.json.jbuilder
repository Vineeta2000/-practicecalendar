date_format ='%Y-%m-%d'

json.id event.id
json.title event.title
json.description event.description
json.start event.start_date.strftime(date_format)
json.end event.end_date.strftime(date_format)