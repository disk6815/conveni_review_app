class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum nationality: { kr: 0, jp: 1 }
  enum language: { ko: 0, ja: 1 }

  def self.nationalities_i18n
    nationalities.keys.index_with { |key| I18n.t("enums.user.nationality.#{key}") }
  end

  def self.languages_i18n
    languages.keys.index_with { |key| I18n.t("enums.user.language.#{key}") }
  end
end
