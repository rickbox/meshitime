
class ShopsController < ApplicationController
  def top; end

  def create
    keyword = params[:keyword]
    redirect_to "/shops?keyword=#{keyword}"
  end

  def show
    keyword = params[:keyword]

    require 'open-uri'
    require 'json'
    require 'active_support'
    require 'active_support/core_ext'

    uri = "https://api.gnavi.co.jp/RestSearchAPI/20171213/"
    access_key = ENV['ACCESS_KEY']
    url = uri << "?keyid=" << access_key << "&hit_per_page=100"  << "&freeword=" << keyword
    url = URI.encode url
    json = open(url)
    hash = Hash.from_xml json
    shops = []

    if hash.has_key?("response")
      hash["response"]["rest"].each do |shop|
        shops.push({
          name: shop["name"],
          url: shop["url"],
          opentime: shop["opentime"],
          holiday: shop["holiday"],
            image1: shop["image_url"]["shop_image1"],
            image2: shop["image_url"]["shop_image2"]
        })
      end
    elsif hash.has_key?("gnavi")
      if hash["gnavi"].has_key?("error")
          if hash["gnavi"]["error"]["code"] == "600"
            @error = "該当する店舗の情報が存在しません"
          end
      end
    else
    @error = "エラーが発生しました"
    end

    @shops = Kaminari.paginate_array(shops).page(params[:page]).per(7)
  end

  def description
  end

end
