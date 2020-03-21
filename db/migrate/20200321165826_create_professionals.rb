class CreateProfessionals < ActiveRecord::Migration[6.0]
  def change
    create_table :professionals do |t|
      t.string :first_name
      t.string :last_name
      t.string :description

      t.timestamps
    end
  end
end
