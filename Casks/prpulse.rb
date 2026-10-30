cask "prpulse" do
  version "0.5.0"
  sha256 "b691860c8ba04c60421145d18c65b1a7ba21e23e236f3832c14122c0edacf3eb"

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
