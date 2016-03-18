# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

document_code = [
    [ "SS", "Счет (основной)" ],
    [ "SR", "Реестр счета (основная часть)" ],
    [ "SA", "Акт о причинах, требующих дополнительного рассмотрения" ],
    [ "SI", "Счет (дополнительный)" ],
    [ "SD", "Реестр счета (исправленная часть)" ],
    [ "SU", "Уведомление по рассчетам между бюджетами (0504817)" ],
    [ "SK", "Справка по консолидируемым расчетам (0503125)" ],
    [ "SV", "Акт сверки взаимных расчетов" ]
]

tfoms_code = [
    [ "49", "ТФОМС Магаданской области" ],
    [ "21", "ТФОМС Чувашской Республики" ]
]

#http://ora.ffoms.ru/portal/page/portal/top/about/general/activity/centr/2ce72e76418522549bf1e1f182f769f4854eead5.crl
certificate = [
    [ "ca", "Сертификат корневого УЦ ФОМС", "http://www.ffoms.ru/system-oms/Certification/certification-doc/now_cert/RootCA-NEW.cer", "RootCA-NEW.cer" ],
    [ "ca", "Сертификат промежуточного УЦ (SUBCAQ)", "http://www.ffoms.ru/system-oms/Certification/certification-doc/now_cert/SubCA-NEW.cer", "SubCA-NEW.cer" ],
    [ "crl", "Список отозванных сертификатов корневого УЦ ФОМС", "http://ucfoms.ffoms.ru/2ce72e76418522549bf1e1f182f769f4854eead5.crl", "2ce72e76418522549bf1e1f182f769f4854eead5.crl" ],
    [ "crl", "Список отозванных сертификатов промежуточного УЦ (SUBCAQ)", "http://ucfoms.ffoms.ru/7cb646a1afd9b2f435dea642134cf9872252b6c1.crl", "7cb646a1afd9b2f435dea642134cf9872252b6c1.crl" ],
    [ "crl", "Список отозванных сертификатов промежуточного УЦ (SUBCAQ) OLD", "http://ucfoms.ffoms.ru/a67b8344ac7543e58f20db6bdd4d1ee74e62d9d5.crl", "a67b8344ac7543e58f20db6bdd4d1ee74e62d9d5.crl" ]
]

configuration = [
    [ "incoming_dir", "Директория входящих документов", "./incoming_docs/" ],
    [ "outcoming_dir", "Директория исходящих документов", "./outcoming_docs/" ],
    [ "archive_dir", "Директория архивных документов", "./archive_docs/" ],
    [ "cert_dir", "Директория хранения сертификатов", "./certificates/" ]
]

DocumentCode.delete_all
document_code.each do |code, name|
  DocumentCode.create!( code: code, name: name )
end

TfomsCode.delete_all
tfoms_code.each do |code, name|
  TfomsCode.create!( code: code, name: name )
end

Certificate.delete_all
certificate.each do |name, description, url, filename|
  Certificate.create!( name: name, description: description, url: url, filename: filename )
end

Configuration.delete_all
configuration.each do |name, description, value|
  Configuration.create!( name: name, description: description, value: value )
end

User.delete_all
User.create!(email: "admin@admin.ru", password: "12345678", admin: true)
