require("rspec")
require("pg")
require("employee")


RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM employees *;")
  end
end
