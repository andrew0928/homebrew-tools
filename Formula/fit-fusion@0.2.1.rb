# Generated from FIT Fusion releases by scripts/sync-fit-fusion.py.
class FitFusionAT021 < Formula
  desc "Merge, inspect and query cycling FIT activities"
  homepage "https://github.com/andrew0928/fit-fusion"
  url "https://github.com/andrew0928/fit-fusion/releases/download/v0.2.1/fit-fusion-v0.2.1-macos-arm64.tar.gz"
  version "0.2.1"
  sha256 "df633176e693b6933718158f16988d0c8927cda368994463995d344fc17bb923"

  keg_only :versioned_formula

  depends_on arch: :arm64
  depends_on :macos

  TOOLS = %w[fit-merge fit-inspector fit-query-files fit-query-garmin].freeze

  def install
    bin.install(*TOOLS)
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
