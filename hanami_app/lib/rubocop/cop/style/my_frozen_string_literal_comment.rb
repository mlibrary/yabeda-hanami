# frozen_string_literal: true

module RuboCop
  module Cop
    module Style
      class MyFrozenStringLiteralComment < FrozenStringLiteralComment
        minimum_target_ruby_version 2.3
      end
    end
  end
end
