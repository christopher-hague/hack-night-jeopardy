# == Schema Information
#
# Table name: questions
#
#  id          :integer          not null, primary key
#  text        :string
#  difficulty  :string
#  category_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Question < ApplicationRecord
  belongs_to :category


end
