# -*- encoding : utf-8 -*-
TestWeixin::Application.routes.draw do
  resource :weixin do
    member do
      get :add_menu
      get :init_menu
    end
  end

  scope :path => "/weixin", :via => :post do 

    match "/" => "weixin#text_message", :constraints => lambda { |request| request.params[:xml][:MsgType] == 'text'}
    match "/" => "weixin#image_message", :constraints => lambda { |request| request.params[:xml][:MsgType] == 'image' }
    match "/" => "weixin#subscribe_message", :constraints => lambda { |request| request.params[:xml][:MsgType] == "event" and request.params[:xml][:Event] == "subscribe" }
    match "/" => "weixin#click_menu_message", :constraints => lambda { |request| request.params[:xml][:MsgType] == "event" and request.params[:xml][:Event] == "CLICK" }
  end
end
