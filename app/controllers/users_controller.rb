# frozen_string_literal: true
class UsersController < ApplicationController # rubocop:disable Layout/EmptyLineAfterMagicComment,Style/Documentation
  def new; end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to new_user_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :username, :password)
  end
end
