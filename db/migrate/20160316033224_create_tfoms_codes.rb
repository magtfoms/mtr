class CreateTfomsCodes < ActiveRecord::Migration
  def change
    create_table :tfoms_codes do |t|
      t.string :code
      t.string :name

      t.timestamps
    end
  end
end
