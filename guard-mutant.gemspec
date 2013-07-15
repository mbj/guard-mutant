Gem::Specification.new do |spec|
  spec.name          = 'guard-mutant'
  spec.version       = '0.0.1'
  spec.authors       = ['Markus Schirp']
  spec.email         = ['mbj@schirp-dso.com']
  spec.summary       = 'Guard plugin for Mutant'
  spec.description   = 'Guard::Mutant automatically mutates Ruby when files are modified.'
  spec.homepage      = 'https://github.com/yujinakayama/guard-rubocop'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/).reject { |f| File.basename(f).start_with?('.') }
  spec.test_files    = spec.files.grep(%r(\A(spec)/))
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'guard',  '~> 1.8'
  spec.add_runtime_dependency 'mutant', '~> 0.3.0.beta15'
end
