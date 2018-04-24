class Error < Exception
end

raise Error

puts "Hello world"


def import_issues!(build, issues)
  timeout = (ENV["PULL_REQUEST_BUILD_RESULT_IMPORT_TIMEOUT"].presence || 10).to_i.minutes
  expires_at = Time.current + timeout

  issues.each do |issue|
    raise TimeoutError if expires_at > Time.current
  end

rescue
  build.repository.organization.with_octokit do |octokit|
    commit_status!(octokit, build, octokit)
  end
end

