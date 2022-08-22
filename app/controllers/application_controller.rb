# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery prepend: true
  # ユーザがログインしていない場合はログインページにリダイレクトさせる
  before_action :authenticate_user!
  # ストロングパラメーターを追加したい場合に使用
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # 新規登録時のストロングパラメータに「郵便番号カラムと住所カラムと自己紹介カラム」の追加
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name zipcode address profile])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name zipcode address profile])
  end
end
