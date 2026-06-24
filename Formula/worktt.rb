class Worktt < Formula
  desc "Derive working hours from macOS knowledgeC.db"
  homepage "https://github.com/sipfl/worktt"
  url "https://github.com/sipfl/worktt/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "24920e248fb4ff552bec673831c57cfba48e892fe2a97d8511abb5b718b2133a"
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
