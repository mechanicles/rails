# frozen_string_literal: true

class LineItem < ActiveRecord::Base
  belongs_to :invoice, touch: true, counter_cache: true
end
