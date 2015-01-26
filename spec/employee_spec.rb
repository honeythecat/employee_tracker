require("spec_helper")

describe(Employee) do
  it("tells which division it belongs to") do
    division = Division.create({:division_name => "Accounting"})
    employee = Employee.create({:first_and_last_name => "John Berry", :division_id => division.id})
    expect(employee.division()).to(eq(division))
  end
end
