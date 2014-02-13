class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body
      t.references :user, index: true
      t.references :article, index: true
      t.integer :sub_comment_id

      t.timestamps
    end
  end
end
