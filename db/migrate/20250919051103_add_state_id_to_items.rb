class AddStateIdToItems < ActiveRecord::Migration[7.1]
  def change
    add_column :items, :state_id, :integer
  end
end
