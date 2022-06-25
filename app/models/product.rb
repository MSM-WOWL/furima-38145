class Product < ApplicationRecord
  validates :item, presence: true
  validates :price, presence: true, format: {with: /\A[0-9]+\z/}, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  validates :explain, presence: true
  validates :category_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :condition_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :postage_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :send_area_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :send_day_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :image, presence: true

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :postage
  belongs_to :send_area
  belongs_to :send_day

end
