class MacimeAt451 < Formula
  desc "Fast IME switcher for macOS"
  homepage "https://github.com/riodelphino/macime"
  license "MIT"
  version "4.5.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/riodelphino/macime/releases/download/v4.5.1/macime-v4.5.1-arm64.tar.gz"
      sha256 "9cad32bd544872b827f0a48a2935ed2e98d5de8e3c7dd3664fd09434ef4ce740"
    else
      url "https://github.com/riodelphino/macime/releases/download/v4.5.1/macime-v4.5.1-x86_64.tar.gz"
      sha256 "cbea70def86a7ec951dddad96cae956b30dd2a838a322f20ef86f3d878c782ca"
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

