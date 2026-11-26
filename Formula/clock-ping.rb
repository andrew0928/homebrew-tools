class ClockPing < Formula
  desc "Measure a web server's clock offset using the HTTP Date header"
  homepage "https://github.com/andrew0928/WebServerClock"
  url "https://github.com/andrew0928/WebServerClock/releases/download/clock-ping-v0.1.0/clock-ping-v0.1.0-macos-arm64.tar.gz"
  version "0.1.0"
  sha256 "8878b465c7ca5104d0e45c5cffc6935f52848cd87bfba12b4f3060d07570a1d4"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "clock-ping"
    doc.install "THIRD-PARTY-NOTICES.txt", "RUST-LIBRARY-COPYRIGHT.html"
  end

  test do
    assert_equal "clock-ping 0.1.0", shell_output("#{bin}/clock-ping --version").strip
    assert_match "HEAD /", shell_output("#{bin}/clock-ping --skill target")
  end
end
