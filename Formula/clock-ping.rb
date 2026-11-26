class ClockPing < Formula
  desc "Measure a web server's clock offset using the HTTP Date header"
  homepage "https://github.com/andrew0928/WebServerClock"
  url "https://github.com/andrew0928/WebServerClock/releases/download/clock-ping-v0.2.0/clock-ping-v0.2.0-macos-arm64.tar.gz"
  version "0.2.0"
  sha256 "02109c3d1b2f1bc5b67dd648b6ee8cff160d4ff7cdf22b2ccdcf182e9dbcf345"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "clock-ping"
    doc.install "THIRD-PARTY-NOTICES.txt", "RUST-LIBRARY-COPYRIGHT.html"
  end

  test do
    assert_equal "clock-ping 0.2.0", shell_output("#{bin}/clock-ping --version").strip
    assert_match "--min-step-ms", shell_output("#{bin}/clock-ping --help")
  end
end
