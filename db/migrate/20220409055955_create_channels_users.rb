class CreateChannelsUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :channels_users, :id => false do |t|
      t.integer :channel_id
      t.integer :users_id
    end
  end
end
