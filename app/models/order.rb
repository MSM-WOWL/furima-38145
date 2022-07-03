class Order
  include ActiveModel::Model
  attr_accessor :postal_code, :send_area_id, :municipalities, :address, :building, :phone_number, :purchase_id, :user_id, :product_id, :token

  validates :postal_code, presence: true, format: {with: /\A\d{3}[-]\d{4}\z/}
  validates :send_area_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :municipalities, presence:true
  validates :address, presence: true
  validates :phone_number, presence: true, format: {with: /\A\d{10,11}\z/}
  validates :user_id, presence: true
  validates :product_id, presence: true
  validates :token, presence: true

  def save
    purchase = Purchase.create(user_id: user_id, product_id: product_id)
    Delivery.create(postal_code: postal_code, send_area_id: send_area_id, municipalities: municipalities, address: address, building: building, phone_number: phone_number, purchase_id: purchase.id)
  end
end