class CreateFollows < ActiveRecord::Migration[6.1]
  def change
    create_table :follows do |t|
      t.integer :followed_id
      t.integer :following_id

      t.timestamps
    end
    add_index :follows, :following_id
    add_index :follows, :followed_id
    add_index :follows, [:following_id, :followed_id], unique: true # 複合キー（あるユーザーが同じユーザーを2回以上フォローすることを防ぐ）
  end
end