cask "prpulse" do
  version "0.5.1"
  sha256 "b1beb44ff39d274793e619d831a8388bacbe628d319779373d6042f35447f4fc"

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
