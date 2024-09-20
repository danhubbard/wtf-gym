class RequestLogger
  def initialize(app)
    @app = app
  end

  def call(env)
    request = Rack::Request.new(env)
    
    # Log request details
    Rails.logger.debug "Request: #{request.request_method} #{request.path}"
    Rails.logger.debug "User Agent: #{request.user_agent}"
    Rails.logger.debug "Accept Header: #{request.accept}"
    
    # Call the next middleware and get the response
    status, headers, response = @app.call(env)
    
    # Log response details
    Rails.logger.debug "Response Status: #{status}"
    Rails.logger.debug "Response Content-Type: #{headers['Content-Type']}"
    
    [status, headers, response]
  end
end