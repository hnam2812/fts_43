class Question < ActiveRecord::Base
  include StateAble
  include PublicActivity::Model

  acts_as_paranoid
  before_destroy :update_question_as_deleted

  belongs_to :subject
  belongs_to :user
  enum status: {waiting: 0, approved: 1, edited: 2, deleted: 3}
  enum question_type: {single: 0, multiple: 1, text: 2}

  has_many :answers, dependent: :destroy
  has_many :results, dependent: :destroy
  has_many :exams, through: :results

  def update_question_as_deleted
    self.update_status :deleted
  end

  accepts_nested_attributes_for :answers, allow_destroy: true,
    reject_if: proc {|answer| answer[:content].blank?}

  validates :content, presence: true
end
