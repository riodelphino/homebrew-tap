class Macime < Formula
  desc "Fast macOS IME switcher CLI"
  homepage "https://github.com/riodelphino/macime"
  url "https://github.com/riodelphino/macime/archive/refs/tags/v2.2.1.tar.gz"
  sha256 "e62aff66b008e3b15b053db0945356a9a3b798f363c6840dcf713e5ec4aa9180"
  license "MIT"

  depends_on :macos

  def install
    system "swift", "build", "-c", "release"
    bin.install ".build/release/macime"
  end
end
