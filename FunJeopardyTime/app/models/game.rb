# == Schema Information
#
# Table name: games
#
#  id         :integer          not null, primary key
#  name       :string
#  score      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Game < ApplicationRecord
  has_many :categories

end
