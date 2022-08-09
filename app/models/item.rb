class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :situation
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :days_to_ship

  belongs_to :user
  has_one_attached :image

  validates :items_name, presence: true 
  validates :explanation, presence: true
  validates :category_id, presence: true 
  validates :situation_id, presence: true
  validates :delivery_charge_id, presence: true 
  validates :prefecture_id, presence: true
  validates :days_to_ship_id, presence: true 
  validates :price, presence: true
  validates :user, presence: true   
end
