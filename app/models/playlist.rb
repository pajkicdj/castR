class Playlist < ActiveRecord::Base
  belongs_to :mood
  has_many :podcasts

  validates :title, presence: true, length: {maximum: 40}

  # def pod_count
  #   pod_num = self.podcasts.size
  #   if pod_num == 1
  #     "#{pod_num} podcast"
  #   else
  #     "#{pod_num} podcasts"
  #   end
  # end

  def pod_count
    self.podcasts.size
  end
end