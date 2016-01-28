require 'uri'

class Url < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!

	validates :long_url, :format => { :with => /\A#{URI::regexp}\z/ ,
    :message => "Url wrong format" }
    validates :shortened_url, :format => { :with => /\A#{URI::regexp}\z/ ,
    :message => "Url wrong format" }

	def shorten
		(0...8).map { ('a'..'z').to_a[rand(26)] }.join
	end

	def hit_short_url(short_url)
		url_detials = Url.find_by(shortened_url: short_url)
		url_plus = url_detials.attributes['click_count']
		url_plus = url_plus + 1
		puts url_detials.update(click_count: url_plus)
	end
end
