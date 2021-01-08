class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  # validates :email, uniqueness: true
  # validates :password, length: { minimum: 6 }
  # validates :password_confirmation, presence: true
  # validates :password, confirmation: true
  # validates :first_name_kanji, presence: true
  # validates :family_name_kana, presence: true
  # validates :first_name_kana, presence: true
  validates :birthday, presence: true

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX,
                                message: 'は半角6文字以上、英大文字・小文字・数字それぞれ１文字以上含む必要があります' }

  VALID_PASSWORD_REGEX = /\A[ぁ-んァ-ン一-龥]/.freeze
  validates :family_name_kanji, presence: true,
                                format: { with: VALID_PASSWORD_REGEX,
                                          message: 'は全角ひらがな、カタカナ、漢字を入力する必要がります' }

  VALID_PASSWORD_REGEX = /\A[ぁ-んァ-ン一-龥]/.freeze
  validates :first_name_kanji, presence: true,
                              format: { with: VALID_PASSWORD_REGEX,
                                        message: 'は全角ひらがな、カタカナ、漢字を入力する必要がります' }

  VALID_PASSWORD_REGEX = /\A[ァ-ヶー－]+\z/.freeze
  validates :family_name_kana, presence: true,
                              format: { with: VALID_PASSWORD_REGEX,
                                        message: 'は全角カタカナを入力する必要がります' }

  VALID_PASSWORD_REGEX = /\A[ァ-ヶー－]+\z/.freeze
  validates :first_name_kana, presence: true,
                              format: { with: VALID_PASSWORD_REGEX,
                                        message: 'は全角カタカナを入力する必要がります' }

  # VALID_PASSWORD_REGEX = /@/
  # validates :email, format: { with: VALID_PASSWORD_REGEX,
                                        # message: 'は@を含める必要があります' }
end