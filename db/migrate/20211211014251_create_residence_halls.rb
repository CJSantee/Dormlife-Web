class CreateResidenceHalls < ActiveRecord::Migration[6.1]
  def change
    create_table :residence_halls do |t|
      t.string :name
      t.references :college
      t.timestamps
    end
  end
end
