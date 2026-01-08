class Macime < Formula
  desc "Fast macOS IME switcher CLI"
  homepage "https://github.com/riodelphino/macime"
  url "https://github.com/riodelphino/macime/archive/refs/tags/v2.2.0.tar.gz"
  sha256 "e16ea3d746ff086a286831bb4e76c743587bf2a742e92db180ae8fdc68745511"
  license "MIT"

  depends_on :macos

  def install
    system "swift", "build", "-c", "release"
    bin.install ".build/release/macime"
  end
end
