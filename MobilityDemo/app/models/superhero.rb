class Superhero < ApplicationRecord
  extend Mobility
  translates :name, type: :string
  translates :description, type: :text

  scope :search, ->(name_q) do
    i18n do
      name.lower.matches("%#{name_q.downcase}%")
    end
  end
end
