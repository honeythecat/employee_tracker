require("spec_helper")


describe(Division) do
  it("tells which employees are in it") do
    division = Division.create({:division_name => "Accounting"})
    employee1 = Employee.create({:first_and_last_name => "John Adams", :division_id => division.id})
    employee2 = Employee.create({:first_and_last_name => "George Bush", :division_id => division.id})
    expect(division.employees()).to(eq([employee1, employee2]))
  end
end
