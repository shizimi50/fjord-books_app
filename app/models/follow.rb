# frozen_string_literal: true

class Follow < ApplicationRecord
  # 同じユーザーモデルであることから、どちらのカラムがどちらのユーザーかを特定するために各カラム名で指定
  belongs_to :following, class_name: 'User'
  belongs_to :followed, class_name: 'User'
end
