cask "prpulse" do
  version "0.4.0"
  sha256 "318bf57da46ac96f10a48c5be097a4ae90ad30b6e3ae1c61c44c390377184de8"

  url "https://github.com/felipeferrarini/prpulse/releases/download/v#{version}/PRPulse-#{version}.dmg"
  name "PRPulse"
  desc "Menu bar app that tells you which GitHub pull requests need you"
  homepage "https://github.com/felipeferrarini/prpulse"

  # The app updates itself with Sparkle, so Homebrew should not fight it.
  auto_updates true
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
