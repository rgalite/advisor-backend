class PopulateQuestionSkipText < ActiveRecord::Migration[5.2]
  def up
    Question.where(skip_text: nil).find_each do |question|
      question.update!(skip_text: I18n.t('questions.default_skip_text'))
    end
  end

  def down
  end
end
