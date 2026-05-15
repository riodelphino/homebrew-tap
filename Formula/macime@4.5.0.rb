class MacimeAt450 < Formula
  desc "Fast IME switcher for macOS"
  homepage "https://github.com/riodelphino/macime"
  license "MIT"
  version "4.5.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/riodelphino/macime/releases/download/v4.5.0/macime-v4.5.0-arm64.tar.gz"
      sha256 "87debc1ca3e38604c8656074b7b6ed3b8abd04e8b3d11d55f6fb4ac51b8078de"
    else
      url "https://github.com/riodelphino/macime/releases/download/v4.5.0/macime-v4.5.0-x86_64.tar.gz"
      sha256 "35939e271e22898b2dd19eb8407966313c403a65a3fbd1822da95608cdc5fcd1"
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

