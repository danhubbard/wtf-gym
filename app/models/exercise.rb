class Exercise < ApplicationRecord
  serialize :instructions, coder: JSON
  serialize :primary_muscles, coder: JSON
  serialize :secondary_muscles, coder: JSON
  serialize :images, coder: JSON

  enum force: {
    pull: 0,
    push: 1,
    static: 2
  }, _prefix: true

  enum level: {
    beginner: 0,
    intermediate: 1,
    expert: 2
  }, _prefix: true

  enum mechanic: {
    compound: 0,
    isolation: 1
  }, _prefix: true

  def instructions
    super || []
  end

  def primary_muscles
    super || []
  end

  def secondary_muscles
    super || []
  end

  def images
    super || []
  end
end