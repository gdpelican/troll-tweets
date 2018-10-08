class AddIndicies < ActiveRecord::Migration[5.2]
  def change
    add_index :tweets, :author
    add_index :tweets, :following
    add_index :tweets, :publish_date
  end
end
