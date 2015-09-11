module Questions
  class ImageUploadsController < ApplicationController
    def create
      img = Question::TempImage.new(image: params['image'])
      if img.save
        render json: { message: "success", id: img.id }, status: 200
      end
    end

    def destroy

    end
  end
end
