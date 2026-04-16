class MacimeAt442 < Formula
  desc "Fast IME switcher for macOS"
  homepage "https://github.com/riodelphino/macime"
  license "MIT"
  version "4.4.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/riodelphino/macime/releases/download/v4.4.2/macime-v4.4.2-arm64.tar.gz"
      sha256 "3b5896453c8f0b4afb8a2bc9dc5799f8585bba7805ba1cfd1e6539e05173ce32"
    else
      url "https://github.com/riodelphino/macime/releases/download/v4.4.2/macime-v4.4.2-x86_64.tar.gz"
      sha256 "3305c9ebc41409f199f1d1e6c4d795da6514b294ab7c6050c82ccddc2471830b"
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

