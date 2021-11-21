class Contact < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  validates :phone_number, presence: true
  validates :message, presence: true
  enum contact_status: { unsupported: 0, support: 1, complete: 2 }
end
