# encoding: utf-8

class HomeController < InheritedResources::Base
  actions :index, :about, :privacy, :terms, :faq
  
  def index
  end
end