class CreateCertificates < ActiveRecord::Migration
  def change
    create_table :certificates do |t|
      t.string :name
      t.string :description
      t.string :url
      t.string :filename

      t.timestamps
    end
  end
end
