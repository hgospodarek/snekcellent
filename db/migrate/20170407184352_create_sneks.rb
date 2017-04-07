class CreateSneks < ActiveRecord::Migration[5.0]
  def change
    create_table :sneks do |t|
      t.string :name, null: false
      t.string :morph
      t.string :sex
      t.integer :age
      t.date :adoption_date
      t.belongs_to :user, null: false

      t.timestamps null: false
    end
  end
end
