class AddDocumentIdToTag < ActiveRecord::Migration[5.2]
  def change
    add_column :tags, :document_id, :integer, null: false
  end
end
