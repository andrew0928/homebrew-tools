class FitFusion < Formula
  desc "Merge, inspect and query cycling FIT activities"
  homepage "https://github.com/andrew0928/homebrew-tools"
  url "https://github.com/andrew0928/homebrew-tools/releases/download/fit-fusion-v0.2.2/fit-fusion-v0.2.2-macos-arm64.tar.gz"
  version "0.2.2"
  sha256 "f9987dac5906e522d98eb843dd610012035758ce5aff356c8ba1ae70ef85d94a"

  depends_on arch: :arm64
  depends_on :macos

  TOOLS = %w[fit-merge fit-inspector fit-query-files fit-query-apple fit-query-garmin].freeze

  def install
    bin.install(*TOOLS)
    pkgshare.install "THIRD-PARTY-NOTICES.txt", "RUST-LIBRARY-COPYRIGHT.html"
  end

  test do
    assert_equal TOOLS.sort, bin.children.map { |tool| tool.basename.to_s }.sort
    TOOLS.each do |tool|
      assert_match tool, shell_output("#{bin}/#{tool} --help")
    end

    mkdir "rides" do
      result = JSON.parse(shell_output("#{bin}/fit-query-files --dir . list --json"))
      assert_equal "ok", result.fetch("status")
      assert_empty result.fetch("activities")
    end
  end
end
