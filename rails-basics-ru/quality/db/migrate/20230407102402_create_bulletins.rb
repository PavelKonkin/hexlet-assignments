class CreateBulletins < ActiveRecord::Migration[7.0]
  def change
    create_table :bulletins do |t|
      t.string :title
      t.text :body
      t.boolean :published, default: false, null: false

      t.timestamps
    end
  end
end
