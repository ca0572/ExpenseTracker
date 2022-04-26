class ApplicationController < ActionController::Base
    skip_before_action :verify_authenticity_token
    before_action :validate_api_key

    def validate_api_key
        return true  if request.headers["API-KEY"]==Rails.application.credentials.api_key
            
        raise CustomErrors::UNAUTHORIZED

    end

end
