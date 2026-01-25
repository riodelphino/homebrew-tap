class Macime < Formula
  desc "Fast IME switcher for macOS"
  homepage "https://github.com/riodelphino/macime"
  url "https://github.com/riodelphino/macime/archive/refs/tags/v3.1.1.tar.gz"
  sha256 "d4fb0564f05497cda19c4a0ed5ba9abca001d5fc73da2f49b9b6a987bee2be58"
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
