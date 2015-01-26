class CreateEmployees < ActiveRecord::Migration
  def change
    create_table(:employees) do |t|
      t.column(:first_and_last_name, :string)
      t.timestamps
    end
  end
end
