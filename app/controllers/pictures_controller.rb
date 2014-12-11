class PictureController < ActionController::Base

	def code_image
	  @image_data = Picture.find(params[:id])
	  @image = @image_data.picture
	  send_data (@image, :type     => "image/jpeg",
	                     :disposition => 'inline')
	end
end