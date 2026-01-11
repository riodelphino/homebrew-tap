class Macime < Formula
  desc "Fast macOS IME switcher CLI"
  homepage "https://github.com/riodelphino/macime"
  url "https://github.com/riodelphino/macime/archive/refs/tags/v2.2.6.tar.gz"
  sha256 "b50f6abd9d6d9dfdccba2fbe83d21559f4e8b9454556a9bb02ec1d5bebd2dbee"
  license "MIT"
  depends_on :macos

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/macime"
  end
end
