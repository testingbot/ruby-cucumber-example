@success = true

def run_tests(platform, browser, version, junit_dir)
  sh("platform=\"#{platform}\" browserName=\"#{browser}\" version=\"#{version}\" CUCUMBER_PUBLISH_QUIET=true parallel_cucumber features --group-by scenarios -o \"--format junit --out #{junit_dir} --format pretty\" -n 20") do | success, _exit_code |
    @success &= success
  end
end

task :default => [:test_testingbot]

task :windows_10_firefox_latest do
  run_tests('Windows 10', 'firefox','latest', 'junit_reports/windows_10_firefox_latest')
end

task :ventura_chrome_latest do
  run_tests('VENTURA', 'chrome', 'latest', 'junit_reports/ventura_chrome_latest')
end

multitask :test_testingbot => [
    :windows_10_firefox_latest,
    :ventura_chrome_latest,
  ] do
    puts 'Running automation'
    raise StandardError, "Tests failed!" unless @success
  end
