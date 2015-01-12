require 'HTTParty'
require 'image_suckr'

class ReplyGifHelper
  def self.tags
    @reply_tags = HTTParty.get("http://replygif.net/api/tags?reaction=1&api-key=#{ENV['replygif_key']}")
    @reply_tags.each_with_object(Array.new(0)) { |tag, tag_list| tag_list << tag['title']}
  end

  def self.gif(tags)
  	gif = nil
  	begin
		response = HTTParty.get('http://replygif.net/api/gifs?tag=' + tags.join(',') + "&tag-operator=or&api-key=#{ENV['replygif_key']}")
		gif = JSON.parse(response.body).sample['file']
	rescue => e
		Rails.logger.info 'Gif Error'
	    Rails.logger.info e
	    Rails.logger.info '------------'
		google = ImageSuckr::GoogleSuckr.new
		gif = google.get_image_url({"q" => tags.sample})
	end
	return gif
  end
end