require("sinatra/activerecord")
require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/employee")
require("pg")


get('/') do
  @employees = Employee.all()
  erb(:index)
end

post('/employees') do
  first_and_last_name = params.fetch('first_and_last_name')
  @employee = Employee.new({:first_and_last_name => first_and_last_name})
  @employee.save()
  erb(:division)
end

get("/employees/:id/edit") do
  @employee = Employee.find(params.fetch("id").to_i())
  erb(:employee_edit)
end

patch("/employees/:id") do
  first_and_last_name = params.fetch("first_and_last_name")
  @employee = Employee.find(params.fetch("id").to_i())
  @employee.update({:first_and_last_name => first_and_last_name})
  @employees = Employee.all()
  erb(:index)
end
