# frozen_string_literal: true

class Invoice < ActiveRecord::Base
  has_many :line_items, autosave: true
  before_save { |record| record.balance = record.line_items.map(&:amount).sum }

  after_touch :silently_update_after_touch_count

  private

  def silently_update_after_touch_count
    update_column(:after_touch_count, self.after_touch_count + 1)
  end

end
