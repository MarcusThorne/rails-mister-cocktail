class AddMeasurementToDoses < ActiveRecord::Migration[6.0]
  def change
    add_column :doses, :measurement, :integer
  end
end
