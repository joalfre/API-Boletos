class AddUserColumnsToVenues < ActiveRecord::Migration[6.1]
  def change
    add_reference :venues, :user, null: false, foreign_key: true
  end
end