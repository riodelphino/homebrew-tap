class MacimeAT303 < Formula
  desc "Fast IME switcher for macOS"
  homepage "https://github.com/riodelphino/macime"
  url "https://github.com/riodelphino/macime/archive/refs/tags/v3.0.3.tar.gz"
  sha256 "4632d85b2ed1a75f55c44b98fc3855656a177da9aba1d43c46d1881f1024933d"
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
    log_path var/"log/macimed.log"
    error_log_path var/"log/macimed.err"
  end 

  test do
    system "#{bin}/macime", "list"
  end
end
