cask "prpulse" do
  version "0.1.0"
  sha256 "03b5ca50accf421964a53a65093afb93f8e6091be302a5235d44398a9724b15d"

  url "https://github.com/felipeferrarini/prpulse/releases/download/v#{version}/PRPulse-#{version}.dmg"
  name "PRPulse"
  desc "Menu bar app that tells you which GitHub pull requests need you"
  homepage "https://github.com/felipeferrarini/prpulse"

  depends_on macos: :sonoma

  app "PRPulse.app"

  zap trash: [
    "~/Library/Application Support/PRPulse",
    "~/Library/Preferences/io.github.felipeferrarini.prpulse.plist",
  ]

  caveats <<~EOS
    PRPulse is not signed with an Apple Developer ID, so macOS blocks the first launch.
    Open it once, then go to System Settings > Privacy & Security and click "Open Anyway"
    next to PRPulse.
  EOS
end
