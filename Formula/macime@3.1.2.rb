class Macime < Formula
  desc "Fast IME switcher for macOS"
  homepage "https://github.com/riodelphino/macime"
  url "https://github.com/riodelphino/macime/archive/refs/tags/v3.1.2.tar.gz"
  sha256 "120e737fd3c1fc9eaa94e29eb3be335489c1bb84225ed7786e7241f3d62d8bc0"
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
    run_at_load false
    log_path var/"log/riodelphino.macimed.log"
    error_log_path var/"log/riodelphino.macimed.err"
  end 

  test do
    system "#{bin}/macime", "list"
  end
end
