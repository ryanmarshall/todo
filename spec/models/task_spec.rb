# frozen_string_literal: true

require 'rails_helper'

describe Task, type: :model do
  context 'with no name' do
    it 'is invalid' do
      task = Task.new
      expect(task).to_not be_valid
      expect(task.completed).to be false
    end
  end
end
