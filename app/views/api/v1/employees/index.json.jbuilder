json.employees @employees do |employee|
    json.(employee,:id,:name,:phone_no,:age,:address)
end