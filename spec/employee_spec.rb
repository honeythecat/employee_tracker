require("spec_helper")

describe(Employee) do

  describe("#first_and_last_name") do
    it("lets you read the first_and_last_name out") do
      test_task = Employee.new({:first_and_last_name => "Bobby Joe"})
      expect(test_task.first_and_last_name()).to(eq("Bobby Joe"))
    end
  end

  describe(".all") do
    it("is empty at first") do
      expect(Employee.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("adds a task to the array of saved tasks") do
      test_task = Employee.new({:first_and_last_name => "Bobby Joe"})
      test_task.save()
      expect(Employee.all()).to(eq([test_task]))
    end
  end

  describe("#==") do
    it("is the same task if it has the same first_and_last_name and list ID") do
      task1 = Employee.new({:first_and_last_name => "Bobby Joe"})
      task2 = Employee.new({:first_and_last_name => "Bobby Joe"})
      expect(task1).to(eq(task2))
    end
  end
end
