class NewsController < ApplicationController
  require "open-uri"
    def index
      api = Rails.application.credentials.news_api[:api_key]
      uri = "https://newsapi.org/v2/everything?q=%E6%9D%B1%E8%A8%BC&sortBy=popularity&apiKey=#{api}"
      article_serialized = open(uri).read
      @articles = JSON.parse(article_serialized)
    end
end