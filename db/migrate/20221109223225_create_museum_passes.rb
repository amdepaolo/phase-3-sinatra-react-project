class CreateMuseumPasses < ActiveRecord::Migration[6.1]
  def change
    create_table :museum_passes do |t|
      t.string :name
      t.string :website 
    end
  end
end
