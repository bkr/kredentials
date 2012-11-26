module Kredentials

  def self.extended(cls)
    cls.cattr_accessor(:config_env)
    cls.config_env = nil
  end

  %W[production development test staging].each do |environment|
    self.send(:define_method, "#{environment}") do
      self.class_variable_defined?("@@#{environment}") ? class_eval("@@#{environment}") : {} 
    end
  end

  self.send(:define_method, :to_hash) do
    hash = self.class_variable_defined?('@@defaults') ? self.class_eval("@@defaults").clone : {}
    env = self.config_env || Rails.env
    hash.merge!(self.class_eval("@@#{env}")) if self.class_variable_defined?("@@#{env}")
    HashWithIndifferentAccess.new(hash)
  end

  def method_missing(method)
    value =
        case self.config_env || Rails.env
          when 'production'
            self.production[method.to_sym]
          when 'staging'
            self.staging[method.to_sym] || self.development[method.to_sym]
          when 'test'
            self.test[method.to_sym]
          else
            self.development[method.to_sym]
        end
    return value || (self.class_variable_defined?('@@defaults') ?
        self.class_eval("@@defaults")[method.to_sym] : nil)
  end

end