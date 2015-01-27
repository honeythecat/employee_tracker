require("sinatra/activerecord")
require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/employee")
require("./lib/division")
require("pg")
require("pry")


get('/') do
  @divisions = Division.all()
  @employees = Employee.all()
  erb(:index)
end

post("/divisions") do
  division_name = params.fetch("division_name")
  division = Division.new({:division_name => division_name})
  division.save()
  @divisions = Division.all()
  @employees = Employee.all()
  erb(:index)
end

post('/employees') do
  first_and_last_name = params.fetch('first_and_last_name')
  division_id = params.fetch("division_id")
  @employee = Employee.new({:first_and_last_name => first_and_last_name, :division_id => division_id})
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

get("/divisions/:id/edit") do
  @division = Division.find(params.fetch("id").to_i())
  division_name = @division.division_name()
  @division.update({:division_name => division_name})
  @divisions = Division.all()
  @employees = Employee.all()
  erb(:division_edit)
end

get("/divisions/:id") do
  @division = Division.find(params.fetch("id").to_i())
  division_name = @division.division_name()
  @division.update({:division_name => division_name})
  @divisions = Division.all()
  @employees = Employee.all()
  erb(:division_edit)
end
