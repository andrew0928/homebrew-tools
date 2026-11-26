# Generated from FIT Fusion releases by scripts/sync-fit-fusion.py.
class FitFusionAT010 < Formula
  desc "Merge, inspect and query cycling FIT activities"
  homepage "https://github.com/andrew0928/fit-fusion"
  url "https://github.com/andrew0928/fit-fusion/releases/download/v0.1.0/fit-fusion-v0.1.0-macos-arm64.tar.gz"
  version "0.1.0"
  sha256 "ee1bb0823fc61ba34813b567849dc1f5903c74c34a89d47a774b79f41c98b5f2"

  keg_only :versioned_formula

  depends_on arch: :arm64
  depends_on :macos

  TOOLS = %w[fit-inspector].freeze

  def install
    bin.install(*TOOLS)
  end

  test do
    assert_equal TOOLS.sort, bin.children.map { |tool| tool.basename.to_s }.sort
    TOOLS.each do |tool|
      assert_match tool, shell_output("#{bin}/#{tool} --help")
    end
  end
end
