class CreateChannels < ActiveRecord::Migration[5.2]
  def change
    create_table :channels do |t|
      t.text :name

      t.timestamps
    end
  end
end
