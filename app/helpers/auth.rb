[Replace].helpers do

  def current_user
    current_user ||=  User.find_by_template_uid(session[:template_uid]) if session.has_key? :template_uid
  end

  def to_previous_url
    url = session[:redirect_url] ||= '/'
    session[:redirect_url] = nil
    url
  end

  def signed_in?
    if !session[:access_token].nil?
      true
    else
      session[:redirect_url] = request.url
      redirect '/auth/template'
    end
  end

  def client(token_method = :post)
    OAuth2::Client.new(
      ENV['API_OAUTH_ID'],
      ENV['API_OAUTH_SECRET'],
      :site         => ENV['API_OAUTH_SITE'],
      :token_method => token_method,
    )
  end

  def get(url, params = {})
    api url, 'get', params
  end

  def api(url, type = 'get', params = {})
    begin
      response = OpenCascade.new(JSON.parse(access_token.send(:"#{type}", "/v1/#{url}").body).recursive_symbolize_keys!)
    rescue OAuth2::Error => @error
      session[:redirect_url] = request.url
      redirect :refresh
    end
  end

  def access_token
    OAuth2::AccessToken.new(client, session[:access_token], :refresh_token => session[:refresh_token])
  end

  def redirect_uri
    ENV['API_OAUTH_REDIRECT_URI']
  end

end

class Hash
  def recursive_symbolize_keys!
    symbolize_keys!
    # symbolize each hash in .values
    values.each{|h| h.recursive_symbolize_keys! if h.is_a?(Hash) }
    # symbolize each hash inside an array in .values
    values.select{|v| v.is_a?(Array) }.flatten.each{|h| h.recursive_symbolize_keys! if h.is_a?(Hash) }
    self
  end
end