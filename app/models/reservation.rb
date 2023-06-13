class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room
  validate :true_date
  validates_presence_of :check_in, :check_out, :headcount
  validates :headcount, presence: true, numericality: { greater_than_or_equal_to: 1 }


  def true_date
    if check_in.present? && check_out.present? && check_in >= check_out
      errors.add(:check_out, "チェックアウト日はチェックイン日より後にしてください")
    end
  end

  def calculate_total_price
    (self.room.price * self.headcount * (self.check_out - self.check_in).to_i).to_i
  end

end
