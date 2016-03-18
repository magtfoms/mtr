require './lib/cryptography/cryptography.rb'
class Incoming_doc
  
  # Список файлов в директории со входящими документами
  def self.list
    Dir.entries(Configuration.incoming_dir).select { |filename| !File.directory? filename }
  end
  
  # Проверяем существование файла
  def self.exist?(document_file_name)
  	File.exist?(Configuration.incoming_dir + document_file_name)
  end  

  # Проверяем валидность документа
  def self.validate_document(document_file_name)
    file = File.read(Configuration.incoming_dir + document_file_name)
  	Cryptography.validate_document file
  end
  
  # Проверяем название документа
  def self.document_info(document_file_name)
    document_codes = DocumentCode.all
    tfoms_codes = TfomsCode.all
    
    
    
    
    
    
    

  end  
  
  
end
