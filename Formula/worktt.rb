class Worktt < Formula
  desc "Derive working hours from macOS knowledgeC.db"
  homepage "https://github.com/sipfl/worktt"
  url "https://github.com/sipfl/worktt/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "52997ae656bf095b1ad68bcf919ee2e0209983ff2eb8b2944f1f532b3db11dbd"
  license "MIT"

  depends_on "go" => :build
  depends_on :macos

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=#{version}")
  end

  def caveats
    <<~EOS
      worktt reads the protected knowledgeC.db. Grant your terminal
      Full Disk Access: System Settings > Privacy & Security
      > Full Disk Access.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/worktt -version")
  end
end
