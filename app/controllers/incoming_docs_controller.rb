class IncomingDocsController < ApplicationController
  
  # Разрешено только для авторизованных пользователей
  before_filter :authenticate_user!#, except => [:show, :index]
  
  # Список входящих документов
  def index
    @incoming_docs = Incoming_doc.list
  end

  # Просмотр входящего документа
  def show
    if params[:document].nil? || params[:document][:document_file_name].nil? then
      flash[:alert] = 'Вы не выбрали входящий документ!'
      redirect_to :action => 'index'
    else
  	  @file_name = params[:document][:document_file_name]
  	  # Проверка существования файла
  	  if Incoming_doc.exist?(@file_name) then
    	  # Обрезаем .sig если он существует
    	  @file_unpacked_name = @file_name.chomp(".sig")
        # Запоминаем имя файла в сессии
    	  session[:incoming_doc_filename] = @file_name
    	  
    	  # Проверяем документ
    	  @document_info = Incoming_doc.document_info @file_name
    	  @validate_document = Incoming_doc.validate_document @file_name
    	  
    	  # Отправляем ответное сообщение
    	  
    	  
    	  
    	  
    	  
    	  
    	  
  	  else
    	  flash[:alert] = 'Выбранный вами входящий документ был перемещен или удален!'
        redirect_to :action => 'index'
  	  end
    end
  
  end

  # Загрузка извлеченного входящего документа
  def download
    # Извлекаем имя файла из сессии
    @file_name = session[:incoming_doc_filename]
    # Проверка существования файла
  	unless Incoming_doc.exist?(@file_name) then
  	  flash[:alert] = 'Выбранный вами входящий документ был перемещен или удален!'
      redirect_to :action => 'index'
  	end
    # Обрезаем .sig если он существует
    @file_unpacked_name = @file_name.chomp(".sig")
    if @file_name then
      @file_data = Incoming_doc.validate_document @file_name
      unless @file_data[0].nil? then
        send_data(@file_data[1], filename: @file_unpacked_name)
      else
        flash[:alert] = 'Ошибка извлечения документа!'
        redirect_to :action => 'index'      
      end
    else
      flash[:alert] = 'Ошибка, имя входящего документа не найдено! Включите кукисы!'
      redirect_to :action => 'index'
    end
  end

end
