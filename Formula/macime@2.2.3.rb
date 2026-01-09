class Macime < Formula
  desc "Fast macOS IME switcher CLI"
  homepage "https://github.com/riodelphino/macime"
  url "https://github.com/riodelphino/macime/archive/refs/tags/v2.2.3.tar.gz"
  sha256 "c236d1c6252a832159c2ceadaa75ff119812001895828bfbb9215c961b2670c0"
  license "MIT"

  depends_on :macos

  def install
    system "swift", "build", "-c", "release"
    bin.install ".build/release/macime"
  end
end
