class Question < ApplicationRecord
  belongs_to :lesson

  broadcasts_to :lesson, target: 'question-list'
end
