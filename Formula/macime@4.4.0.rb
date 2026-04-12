class MacimeAt440 < Formula
  desc "Fast IME switcher for macOS"
  homepage "https://github.com/riodelphino/macime"
  license "MIT"
  version "4.4.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/riodelphino/macime/releases/download/v4.4.0/macime-v4.4.0-arm64.tar.gz"
      sha256 "a47db75456727466d0e2807eff242320c8f4a5b7224d5a0dff2420421c2118c6"
    else
      url "https://github.com/riodelphino/macime/releases/download/v4.4.0/macime-v4.4.0-x86_64.tar.gz"
      sha256 "33957996949b7856100cd32eaa783503b4d89b98a401232114c1c211717b61f7"
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
