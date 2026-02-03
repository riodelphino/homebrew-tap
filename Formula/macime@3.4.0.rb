class MacimeAt340 < Formula
  desc "Fast IME switcher for macOS"
  homepage "https://github.com/riodelphino/macime"
  url "https://github.com/riodelphino/macime/archive/refs/tags/v3.4.0.tar.gz"
  sha256 "3ee8af19c3df950a1b6d0f2b7ea568a251152bf41a61d2be633d057d26ab6bbd"
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
    environment_variables(
      MACIME_PATH: opt_bin/"macime"
    )
    log_path var/"log/riodelphino/macimed.out.log"
    error_log_path var/"log/riodelphino/macimed.err.log"
  end 

  test do
    system "#{bin}/macime", "list"
  end
end
