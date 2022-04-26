module CustomErrors
    # Error Constants

  BAD_REQUEST                  = 400
  VALIDATION_ERROR             = 400
  UNAUTHORIZED                 = 401
  FORBIDDEN                    = 403
  NOT_FOUND                    = 404
  NOT_ALLOWED                  = 405
  CONFLICT                     = 409
  PRE_CONDITION_FAILED         = 412
  UNPROCESSABLE_ENTITY         = 422
  FAILED_DEPENDENCY            = 424
  INTERNAL_SERVER_ERROR        = 500
  AUTH0_SERVICE_UNAVAILABLE    = 503
  PLATFORM_SERVICE_UNAVAILABLE = 503
  SERVICE_UNAVAILABLE          = 503

  class ResponseError < StandardError
    def initialize(message = nil)
      message.is_a?(Array) ? super(message.first) : super(message)
    end
  end

end