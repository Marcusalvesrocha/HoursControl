class CreateTimePointings < ActiveRecord::Migration[6.0]
  def change
    create_table :time_pointings do |t|
      t.references :employee, null: false
      t.datetime :point_registration
      t.integer :shift
      t.integer :kind

      t.timestamps
    end
  end
end
