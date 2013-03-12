desc 'Compile the source'
task :build do
  sh 'cabal-dev install'
end

desc 'Run the program'
task run: :build do
  sh './dist/build/ips/ips'
end
