class Employee
  attr_reader(:first_and_last_name)

  define_method(:initialize) do |attributes|
    @first_and_last_name = attributes.fetch(:first_and_last_name)
  end

  define_method(:first_and_last_name) do
    @first_and_last_name
  end

  define_singleton_method(:all) do
    returned_employees = DB.exec("SELECT * FROM employees;")
    employees = []
    returned_employees.each() do |employee|
      first_and_last_name = employee.fetch("first_and_last_name")
      employees.push(Employee.new(:first_and_last_name => first_and_last_name))
    end
    employees
  end

  define_method(:save) do
    DB.exec("INSERT INTO employees (first_and_last_name) VALUES ('#{@first_and_last_name}');")
  end

  define_method(:==) do |another_employee|
    self.first_and_last_name().==(another_employee.first_and_last_name())
  end
end
