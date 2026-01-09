class Macime < Formula
  desc "Fast macOS IME switcher CLI"
  homepage "https://github.com/riodelphino/macime"
  url "https://github.com/riodelphino/macime/archive/refs/tags/v2.2.2.tar.gz"
  sha256 "062fb1f9d0a6bc26dfd9a7192bd47e05417625ad3e8c941d1c90b2d71836a9a1"
  license "MIT"

  depends_on :macos

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/macime"
  end
end
