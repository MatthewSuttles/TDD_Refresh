class CreatePublications < ActiveRecord::Migration
  def change
    create_table :publications do |t|
      t.belongs_to :author, index: true
      t.belongs_to :book, index:true

      t.timestamps null: false
    end
  end
end
