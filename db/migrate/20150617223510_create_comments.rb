class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.belongs_to :article, index: true
      t.text :content

      t.timestamps null: false
    end
  end
end
