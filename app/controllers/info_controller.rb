class InfoController < ApplicationController
  unloadable

 def index

    @project = Project.find(params[:project_id])

    cf = CustomField.where("type='ProjectCustomField' and name='CRYPTOSTOCKS_TICKER'").first
    return if cf.nil?

    cv = CustomValue.where("customized_type='Project' and customized_id=? and custom_field_id=?",@project.id,cf.id).first
    return if cv.nil?

    ret = call_https("https://cryptostocks.com","/api/get_security_info.json?ticker=#{cv.value}")
    return if ret.nil?

    @ticker = cv.value
    @currency = ret["currency"]
    @number_public_shares = ret["number_public_shares"].to_i
    @highest_bid = ret["highest_bid"]
    @lowest_ask = ret["lowest_ask"]
    @last_price = ret["last_price"]
    @volume24h = ret["volume_24h"]
    @volume5d = ret["volume_5d"]
    @volume30d = ret["volume_30d"]
    @orderexecutions = call_https("https://cryptostocks.com","/api/get_orderexecutions?ticker=#{cv.value}")

    return if @orderexecutions==""
    @is_listed = true
  end

  def call_https(my_url,my_params)
  uri = URI.parse(my_url)
  http = Net::HTTP.new(uri.host, '443')
  http.use_ssl = true
  http.verify_mode = OpenSSL::SSL::VERIFY_PEER
  response=""
  resp=""
  http.start do |http|
   cmd = my_params
   req = Net::HTTP::Get.new(cmd)
   response = http.request(req)
   resp = response.body
  end
  return "" if resp.nil?
  return "" if resp==""
  return ActiveSupport::JSON.decode(resp)
  end
end
