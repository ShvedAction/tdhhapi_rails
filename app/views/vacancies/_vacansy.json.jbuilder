json.extract! vacansy, :id, :area_id, :description, :alternate_url, :name, :archived, :type_name, :published_at, :created_at, :updated_at
json.url vacancy_url(vacansy, format: :json)