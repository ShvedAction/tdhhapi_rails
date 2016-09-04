# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


#Импорт вакансий и городв из HH

ActiveRecord::Base.transaction do

  # импорт Российских городов
  Area.import 113 unless Area.find_by id: 113

  # импорт вакансий
  # для каждого города 4 страници это не больше 80 вакансий
  # городов примерно 1900
  Area.all.limit(100).each {|area| area.import_all_vacancies page_limit: 3}
end