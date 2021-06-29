class ChangeYipBodyType < ActiveRecord::Migration[5.2]
  def change
    change_column :yips, :body, :string
  end
end

#do not edit or delete migration files after they have been migrated
#instead, create a new migration file to change/edit your tables