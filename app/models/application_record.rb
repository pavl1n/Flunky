# frozen_string_literal: false

# This module smells of :reek:IrresponsibleModule
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
