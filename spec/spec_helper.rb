require("rspec")
require("pg")
require("sinatra/activerecord")
require("employee")


RSpec.configure do |config|
  config.after(:each) do
    Employee.all().each() do |employee|
      task.destroy()
    end
  end
end
