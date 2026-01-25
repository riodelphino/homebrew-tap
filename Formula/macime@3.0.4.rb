class Macime < Formula
  desc "Fast IME switcher for macOS"
  homepage "https://github.com/riodelphino/macime"
  url "https://github.com/riodelphino/macime/archive/refs/tags/v3.0.4.tar.gz"
  sha256 "d418ac775a020bd957233d3fcac2dae15c23b30f62577be5a877b30fedd6d616"
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
