# rubocop:disable Style/FrozenStringLiteralComment
# rubocop:enable Style/FrozenStringLiteralComment
# This class will be updated in future
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
