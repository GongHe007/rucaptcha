module RuCaptcha
  class CaptchaController < ActionController::Base
    def index
      return head :ok if request.head?
      headers['Cache-Control'] = 'no-cache, no-store, max-age=0, must-revalidate'
      headers['Pragma'] = 'no-cache'
      data = "data:image/png;base64," + Base64.strict_encode64(generate_rucaptcha)
      # opts = { disposition: 'inline', type: 'image/gif' }
      render json: { success: true, data: data }
    end
  end
end
