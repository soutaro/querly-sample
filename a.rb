class ImportTimeoutError < Exception
  attr_reader :duration, :issues

  def initialize(duration, issues)
    @duration = duration
    @issues = issues
  end
end

raise Error

puts "Hello world"


def import_issues!(build, issues)
  timeout = (ENV["PULL_REQUEST_BUILD_RESULT_IMPORT_TIMEOUT"].presence || 10).to_i.minutes
  expires_at = Time.current + timeout

  issues.each do |issue|
    raise ImportTimeoutError.new(timeout, issues.size) if expires_at > Time.current
  end

rescue
  commit_status!(build.repository.organization.octokit, build, :error)
  raise
end

