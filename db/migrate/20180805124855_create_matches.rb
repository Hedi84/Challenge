class CreateMatches < ActiveRecord::Migration[5.2]
  def change
    create_table :matches do |t|
      t.references :category, foreign_key: true
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
