class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title
      t.date :date
      t.time :time
      t.boolean :public
      t.string :category
      t.text :comments

      t.timestamps
    end
  end
end
