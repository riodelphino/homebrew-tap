class Macime < Formula
  desc "Fast IME switcher for macOS"
  homepage "https://github.com/riodelphino/macime"
  url "https://github.com/riodelphino/macime/archive/refs/tags/v3.0.2.tar.gz"
  sha256 "5bbe80f96b612d8ba9ce150be0b6e21aa43f597e5d96d98d625d690d62e641cf"
  license "MIT"

  depends_on :xcode => :build

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/macime"
    bin.install ".build/release/macimed"
  end

  # NOT TESTED
  # def plist
  #   File.read("#{buildpath}/Sources/macimed/Resources/com.riodelphino.macimed.plist")
  # end

  # ERROR
  # def plist
  #   plist = File.read("#{buildpath}/Sources/macimed/Resources/com.riodelphino.macimed.plist")
  #   plist
  #     .gsub('#{opt_bin}', opt_bin.to_s)
  #     .gsub('#{var}', var.to_s)
  # end
 
  # def plist; <<~EOS
  #   <?xml version="1.0" encoding="UTF-8"?>
  #   <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" 
  #    "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
  #   <plist version="1.0">
  #   <dict>
  #     <key>Label</key>
  #     <string>#{plist_name}</string>
  #
  #     <key>ProgramArguments</key>
  #     <array>
  #       <string>#{opt_bin}/macimed</string>
  #     </array>
  #
  #     <key>RunAtLoad</key>
  #     <true/>
  #
  #     <key>KeepAlive</key>
  #     <true/>
  #
  #     <key>StandardErrorPath</key>
  #     <string>#{var}/log/macimed.err</string>
  #
  #     <key>StandardOutPath</key>
  #     <string>#{var}/log/macimed.out</string>
  #   </dict>
  #   </plist>
  # EOS
  # end

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
