class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :reviews, dependent: :destroy # Userが削除されたら、関連するReviewも削除される

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum nationality: { kr: 0, jp: 1 }
  enum language: { ko: 0, ja: 1 }

  validates :name, presence: true, length: { maximum: 50 }

  def self.nationalities_for_select
    nationalities.keys.map do |key|
      [I18n.t("enums.user.nationality.#{key}"), key]
    end
  end

  def self.languages_for_select
    languages.keys.map do |key|
      [I18n.t("enums.user.language.#{key}"), key]
    end
  end
end
