class MacimeAT320 < Formula
  desc "Fast IME switcher for macOS"
  homepage "https://github.com/riodelphino/macime"
  url "https://github.com/riodelphino/macime/archive/refs/tags/v3.2.0.tar.gz"
  sha256 "5318ffec69646ef20686c769f758c39c7a6b26c47ea75319a50230e181b13724"
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
