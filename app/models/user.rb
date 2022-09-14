# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar

  # 同じフォローモデルのため、どちらのカラムにどのユーザーが格納されているか区別するために別名で（架空の）テーブル名を指定
  has_many :active_follows, class_name: 'Follow', foreign_key: 'following_id', dependent: :destroy, inverse_of: 'following'
  has_many :passive_follows, class_name: 'Follow', foreign_key: 'followed_id', dependent: :destroy, inverse_of: 'followed'

  # throughは、中間テーブルを介する際に利用
  # sourceには、throughした先のModelに紐づいている値を指定する
  # フォロー一覧でメソッドを利用できるために設定（user.followings）が使える
  has_many :followings, through: :active_follows, source: :followed
  # フォロワー一覧でメソッドを利用できるために設定（user.followers）が使える
  has_many :followers, through: :passive_follows, source: :following

  def following?(other_user)
    followings.include?(other_user)
  end
end
