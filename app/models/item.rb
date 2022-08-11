class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :situation
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :days_to_ship
  

  belongs_to :user
  has_one_attached :image
  has_one :purchase_record

  validates :image     , presence: true
  validates :items_name, presence: true 
  validates :explanation, presence: true
  validates :category_id, presence: true 
  validates :situation_id, presence: true
  validates :delivery_charge_id, presence: true 
  validates :prefecture_id, presence: true
  validates :days_to_ship_id, presence: true 
  validates :price, presence: true,numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to:9999999, only_integer:true }

  validates :days_to_ship_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :situation_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :delivery_charge_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}

end
