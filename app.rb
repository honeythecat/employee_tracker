require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("sinatra/activerecord")
require("./lib/employee")
require("pg")


get('/') do
  @employees = Employee.all()
  erb(:index)
end

post('/employee') do
  first_and_last_name = params.fetch('first_and_last_name')
  @employee = Employee.new({:first_and_last_name => first_and_last_name})
  @employee.save()
  erb(:division)
end
