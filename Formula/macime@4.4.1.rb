class MacimeAt441 < Formula
  desc "Fast IME switcher for macOS"
  homepage "https://github.com/riodelphino/macime"
  license "MIT"
  version "4.4.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/riodelphino/macime/releases/download/v4.4.1/macime-v4.4.1-arm64.tar.gz"
      sha256 "7e75bd7cd484e11a45cec6186cb21d6a8be991843b2b083160582cd8a2d61b5a"
    else
      url "https://github.com/riodelphino/macime/releases/download/v4.4.1/macime-v4.4.1-x86_64.tar.gz"
      sha256 "b588842db3c388d081e075497fd0c0168d388257c1f325b0ce81dd04c4cef293"
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

