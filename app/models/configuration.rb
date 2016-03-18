class Configuration < ActiveRecord::Base
  
  # Пути к директории с сертификатами
  def self.cert_dir
    Configuration.where(name: 'cert_dir').to_a.map{|record| record.value}.first
  end  
  
  # Списки отозванных сертификатов
  def self.clr_files
    Certificate.where(name: 'crl').to_a.map{|record| record.filename}
  end
  
  # Списки корневых сертификатов
  def self.ca_files
    Certificate.where(name: 'ca').to_a.map{|record| record.filename}
  end
  
  # Путь к директории со входящими документами
  def self.incoming_dir
    Configuration.where(name: 'incoming_dir').to_a.map{|record| record.value}.first
  end
  
end
