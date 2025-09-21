class AddNotNullConstraintToStateIdOnItems < ActiveRecord::Migration[7.1]
  def change
    change_column_null :items, :state_id, false
  end
end
