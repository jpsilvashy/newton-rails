#!/usr/bin/env rake
require 'bundler/gem_tasks'
require 'rake/testtask'

namespace :newton do

  desc "Pulls Newton Scss"
  task :pull do
    if !system "cd newton && git pull"
      abort "...."
    end
  end

  NEWTON_JS = FileList["newton/javascripts/*.*"]
  ASSETS_JS = NEWTON_JS.pathmap("app/assets/javascripts/newton/newton/%f")
  ASSETS_JS.zip(NEWTON_JS).each do |target, source|
    file target => [source] { cp source, target, verbose: true }
  end

  NEWTON_SCSS = FileList["newton/scss/*.*"]
  ASSETS_SCSS = NEWTON_SCSS.pathmap("app/assets/stylesheets/newton/newton/_%f")
  ASSETS_SCSS.zip(NEWTON_SCSS).each do |target, source|
    target.gsub!(/__/, '_')
    file target => [source] { cp source, target, verbose: true }
  end

  desc "Update Newton JS"
  task :js => ASSETS_JS do
    js = {}
    ASSETS_JS.pathmap("%f").each { |f| js[f] = 1 }

    # dependencies
    order = %w{base.js}
    order.each_with_index {|o, i| js[o] = i }

    list = js.to_a.sort {|a,b| a[1] <=> b[1]}.map{|p| p[0]}
    File.write "app/assets/javascripts/newton/newton.js", list.map {|f| "//= require newton/newton/#{f}"}.join("\n")
  end

  desc "Update Newton SCSS"
  task :scss => ASSETS_SCSS do
    File.write "app/assets/stylesheets/newton/newton.scss", '@import "newton/newton/newton";'
  end

  desc "Clean gem assets files"
  task :clean do
    FileUtils.rm_rf 'app/assets'
    FileUtils.mkpath 'app/assets/javascripts/newton/newton'
    FileUtils.mkpath 'app/assets/stylesheets/newton/newton'
  end

  desc "Update Newton Assets"
  task :assets => [:pull, :clean, :scss, :js]

end

Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = FileList['test/*_test.rb']
  t.verbose = true
end
