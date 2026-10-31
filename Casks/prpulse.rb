cask "prpulse" do
  version "0.7.0"
  sha256 "a1ae453c6c74213c945bdfa86ee42eb5e3a6c4e5474719cfd51ff776dd0ca0bd"

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
    Click OK on the warning, then go to System Settings > Privacy & Security and click
    "Open Anyway" next to PRPulse. Or, in the terminal:

      xattr -dr com.apple.quarantine /Applications/PRPulse.app

    You only do this once: the automatic updates should not ask again.
  EOS
end
