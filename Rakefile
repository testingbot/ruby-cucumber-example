@success = true

def run_tests(platform, browser, version, junit_dir)
  sh("platform=\"#{platform}\" browserName=\"#{browser}\" version=\"#{version}\" parallel_cucumber features --group-by scenarios -o \"--format junit --out #{junit_dir} --format pretty\" -n 20") do | success, _exit_code |
    @success &= success
  end
end

task :default => [:test_testingbot]

task :windows_10_ie_11 do
  run_tests('Windows 10', 'internet explorer', '11', 'junit_reports/windows_10_ie_11')
end

task :windows_7_firefox_latest do
  run_tests('Windows 7', 'firefox','latest', 'junit_reports/windows_7_firefox_latest')
end

task :os_x_10_14_chrome_latest do
  run_tests('OS X 10.14', 'chrome', 'latest', 'junit_reports/os_x_10_14_chrome_latest')
end

multitask :test_testingbot => [
    :windows_10_ie_11,
    :windows_7_firefox_latest,
    :os_x_10_14_chrome_latest,
  ] do
    puts 'Running automation'
    raise StandardError, "Tests failed!" unless @success
  end
