require 'rdoc/task'
require 'rake/packagetask'
require 'rubygems/package_task'

PKG_FILES = FileList["lib/*.rb", "Rakefile", "LICENSE", "README.rdoc"]

spec = Gem::Specification.new do |s|
  s.summary = "Library to guess the MIME type of a file with both filename lookup and magic file detection"
  s.name = "shared-mime-info"
  s.author = "Mael Clerambault"
  s.email =  "mael@clerambault.fr"
  s.version = '0.1'
  s.files = PKG_FILES.to_a
end

RDoc::Task.new do |rd|
  rd.rdoc_files.include "README.rdoc", "lib/*.rb"
  rd.options << "--inline-source"
end

Gem::PackageTask.new(spec).define

desc 'Generate the magics parser'
file "lib/magics.rb" => "magics.rl" do |t|
  sh "ragel -R -o #{t.name} #{t.prerequisites.join(' ')}"
end

desc 'Generate the gemspec'
task :spec do
  open("#{spec.name}.gemspec", "w") {|g| g.puts spec.to_ruby }
end

desc "Open an pry session preloaded with this library"
task :console do
  require 'pry' rescue nil
  console = defined?(Pry) ? :pry : :irb
  sh "#{console} -rubygems -I lib -r shared-mime-info.rb"
end