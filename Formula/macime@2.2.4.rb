class Macime < Formula
  desc "Fast macOS IME switcher CLI"
  homepage "https://github.com/riodelphino/macime"
  url "https://github.com/riodelphino/macime/archive/refs/tags/v2.2.4.tar.gz"
  sha256 "102cef378ed3f87bd915040dee0c6557fbdc160f4932a362ad2a4c8374bf108b"
  license "MIT"
  depends_on :macos

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/macime"
  end
end
