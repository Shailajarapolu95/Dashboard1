class CreateSports < ActiveRecord::Migration[7.0]
  def change
    create_table :sports do |t|
      t.string :sports_name
      t.string :age
      t.string :address

      t.timestamps
    end
  end
end
