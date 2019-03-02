# frozen_string_literal: true

class ShopsController < ApplicationController
  def top; end

  def create
    @keyword = params[:keyword]
    redirect_to "/show?keyword=#{@keyword}"
  end

  def show
    @keyword = params[:keyword]
  end
end
