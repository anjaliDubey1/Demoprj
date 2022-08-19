json.employees @employees do |employee|
    json.(employee,:id,:name,:email,:phone_no,:age,:address)
end