require 'output/templates'
require_relative 'support/string_extensions'

# See http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration
RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.default_formatter = 'doc' if config.files_to_run.one?
  config.disable_monkey_patching!
  config.profile_examples = 10
  config.order = :random
  config.warnings = false # SASS is too noisy :(

  Kernel.srand config.seed
end

include Output::Templates # rubocop:disable Style/MixinUsage
