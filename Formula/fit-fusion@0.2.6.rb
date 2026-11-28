# Generated from FIT Fusion releases by scripts/sync-fit-fusion.py.
class FitFusionAT026 < Formula
  desc "Merge, inspect and query cycling FIT activities"
  homepage "https://github.com/andrew0928/fit-fusion"
  license "MIT"
  url "https://github.com/andrew0928/fit-fusion/releases/download/v0.2.6/fit-fusion-v0.2.6-macos-arm64.tar.gz"
  version "0.2.6"
  sha256 "e8ef86b551d654311ae6d9a429b933a66419e19bfdfff7683a800394747393a6"

  keg_only :versioned_formula

  depends_on arch: :arm64
  depends_on :macos

  TOOLS = %w[fit-merge fit-inspector fit-query-files fit-query-apple fit-query-garmin].freeze

  def install
    bin.install(*TOOLS)
    pkgshare.install "THIRD-PARTY-NOTICES.txt", "RUST-LIBRARY-COPYRIGHT.html", "config.example.yaml", "LICENSE"
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
