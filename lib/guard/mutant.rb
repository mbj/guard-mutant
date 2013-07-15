require 'guard'
require 'guard/guard'

require 'inflecto'
require 'mutant'

module Guard
  # Mutant guard
  class Mutant < Guard

    PREFIX = %r(\A#{Regexp.union('lib', 'app/models', 'app/controllers')})
    SUFFIX = %r(\.rb\z)
    EMPTY_STRING = ''.freeze

    # Hook called when paths where changed
    #
    # @param [Enumerable<String>]
    #
    # @raise [:task_has_failed]
    #   if mutant run failed
    #
    # @return [self]
    #   otherwise
    #
    # @api private
    #
    def run_on_changes(paths)
      subjects = paths.map do |path|
        Inflecto.camelize(path.sub(PREFIX, EMPTY_STRING).sub(SUFFIX, EMPTY_STRING))
      end
      status = ::Mutant::CLI.run(%w(--rspec-dm2 --fail-fast) + subjects)
      throw :task_has_failed if status.nonzero?
      self
    end

  end # Mutant
end # Guard
