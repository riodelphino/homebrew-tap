class Macime < Formula
  desc "Fast macOS IME switcher CLI"
  homepage "https://github.com/riodelphino/macime"
  url "https://github.com/riodelphino/macime/archive/refs/tags/v2.3.0.tar.gz"
  sha256 "8f3583501b3d20f4de603c52ad8bead229aee498d5c5bddbe151816e191ccfea"
  license "MIT"
  depends_on :macos

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/macime"
  end
end
