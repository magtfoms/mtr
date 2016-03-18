class ConfigurationController < ApplicationController
  
  # ТЕСТОВЫЕ ВЫБОРКИ
  def index
    @users = User.all
    @document_codes = DocumentCode.all
    @tfoms_codes = TfomsCode.all
    @configuration = ::Configuration.all
    @crl_files = Certificate.where(name: 'crl')
    @ca_files = Certificate.where(name: 'ca')
  end
  
end
