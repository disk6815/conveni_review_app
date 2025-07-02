class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :reviews, dependent: :destroy #Userが削除されたら、関連するReviewも削除される

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum nationality: { kr: 0, jp: 1 }
  enum language: { ko: 0, ja: 1 }

  validates :name, presence: true, length: { maximum: 50 }

  def self.nationalities_i18n #enumのキーをi18nで翻訳したものを返す
    nationalities.keys.index_with { |key| I18n.t("enums.user.nationality.#{key}") }
  end

  def self.languages_i18n
    languages.keys.index_with { |key| I18n.t("enums.user.language.#{key}") }
  end
end