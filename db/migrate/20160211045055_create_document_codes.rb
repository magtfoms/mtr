class CreateDocumentCodes < ActiveRecord::Migration
  def change
    create_table :document_codes do |t|
      t.string :code
      t.string :name

      t.timestamps
    end
  end
end
