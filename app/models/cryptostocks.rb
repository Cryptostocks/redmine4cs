class Cryptostocks < ActiveRecord::Base
  unloadable
  def self.show_ticker(p)
    cf = CustomField.where("type='ProjectCustomField' and name='CRYPTOSTOCKS_TICKER'").first
    return false if cf.nil?
    return false if p.nil?
    cv = CustomValue.where("customized_type='Project' and customized_id=? and custom_field_id=?",p.id,cf.id).first
    return false if cv.nil?
    return false if cv.value.nil?
    cv.value.strip!
    return cv.value != ""
  end
end
