class Macime < Formula
  desc "Fast IME switcher for macOS"
  homepage "https://github.com/riodelphino/macime"
  url "https://github.com/riodelphino/macime/archive/refs/tags/v3.2.2.tar.gz"
  sha256 "a89fdc3a7d479d7d8a8ce148a42035a0993c7f9860d0a2a82a654477708a6b7f"
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
