class MacimeAt431 < Formula
  desc "Fast IME switcher for macOS"
  homepage "https://github.com/riodelphino/macime"
  license "MIT"
  version "4.3.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/riodelphino/macime/releases/download/v4.3.1/macime-v4.3.1-arm64.tar.gz"
      sha256 "29066dc7851eca595b530e7a194df847581147156a133fd03f19184bce09d94c"
    else
      url "https://github.com/riodelphino/macime/releases/download/v4.3.1/macime-v4.3.1-x86_64.tar.gz"
      sha256 "465dbc95bd9cd62ad49441446d8c27313c8e5d3e3303694d3da400a4cb6e3457"
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
