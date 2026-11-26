# Generated from FIT Fusion releases by scripts/sync-fit-fusion.py.
class FitFusion < Formula
  desc "Merge, inspect and query cycling FIT activities"
  homepage "https://github.com/andrew0928/fit-fusion"
  url "https://github.com/andrew0928/fit-fusion/releases/download/v0.2.3/fit-fusion-v0.2.3-macos-arm64.tar.gz"
  version "0.2.3"
  sha256 "0ebab57982a5dcf652c6396436937f61ef7972d682804c496338bc860d2d2814"

  depends_on arch: :arm64
  depends_on :macos

  TOOLS = %w[fit-merge fit-inspector fit-query-files fit-query-apple fit-query-garmin].freeze

  def install
    bin.install(*TOOLS)
    pkgshare.install "THIRD-PARTY-NOTICES.txt", "RUST-LIBRARY-COPYRIGHT.html", "config.example.yaml"
  end

  def caveats
    "To create a fully commented personal config, run: #{opt_bin}/fit-query-files config init"
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
