class AddLinkToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :links, :text
  end
end
