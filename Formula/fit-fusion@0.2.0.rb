# Generated from FIT Fusion releases by scripts/sync-fit-fusion.py.
class FitFusionAT020 < Formula
  desc "Merge, inspect and query cycling FIT activities"
  homepage "https://github.com/andrew0928/fit-fusion"
  url "https://github.com/andrew0928/fit-fusion/releases/download/v0.2.0/fit-fusion-v0.2.0-macos-arm64.tar.gz"
  version "0.2.0"
  sha256 "2b5a3e8162cdfdd5784af9cc0c18c3f637e9276f943ae0f6c4a5b20eba18b8dc"

  keg_only :versioned_formula

  depends_on arch: :arm64
  depends_on :macos

  TOOLS = %w[fit-merge fit-inspector fit-query-files].freeze

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
