class RemoveCreationDateFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :creation_date, :date
  end
end
