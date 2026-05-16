class MacimeAt460 < Formula
  desc "Fast IME switcher for macOS"
  homepage "https://github.com/riodelphino/macime"
  license "MIT"
  version "4.6.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/riodelphino/macime/releases/download/v4.6.0/macime-v4.6.0-arm64.tar.gz"
      sha256 "7bb7255eab650260a54eed89acb3ae878628d3736bc6e2386500cc7ba410d5df"
    else
      url "https://github.com/riodelphino/macime/releases/download/v4.6.0/macime-v4.6.0-x86_64.tar.gz"
      sha256 "3c4ec0ca7602e24362f4173976c55fc7f764efa1764273ec0051e92651ec4306"
    end
  end

  def install
    bin.install "macime"
    bin.install "macimed"
  end

  service do
    run [opt_bin/"macimed"]
    keep_alive true
    run_at_load false
    log_path var/"log/riodelphino/macimed.out.log"
    error_log_path var/"log/riodelphino/macimed.err.log"
  end 

  test do
    system "#{bin}/macime", "list"
  end
end

