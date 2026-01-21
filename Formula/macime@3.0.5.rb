class Macime < Formula
  desc "Fast IME switcher for macOS"
  homepage "https://github.com/riodelphino/macime"
  url "https://github.com/riodelphino/macime/archive/refs/tags/v3.0.5.tar.gz"
  sha256 "41a42fc27c464d5ca3a8c8a5bbd626dfaa2116bf3abcdbdee2189aad08628e56"
  license "MIT"

  depends_on :xcode => :build

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/macime"
    bin.install ".build/release/macimed"
  end

  service do
    run [opt_bin/"macimed"]
    keep_alive true
    log_path var/"log/riodelphino.macimed.log"
    error_log_path var/"log/riodelphino.macimed.err"
  end 

  test do
    system "#{bin}/macime", "list"
  end
end
