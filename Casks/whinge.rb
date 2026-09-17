cask "whinge" do
  version "0.1.5"
  sha256 "9e4e8e913d164c077850f05df37648c1aa7038b9e52e9e6016448013d4e5db90"

  url "https://downloads.whinge.computer/releases/#{version}-9e4e8e913d164c07/Whinge-#{version}.dmg"
  name "Whinge"
  desc "Record spoken feedback and annotate the screen"
  homepage "https://whinge.computer/"

  livecheck do
    url "https://downloads.whinge.computer/latest.json"
    strategy :json do |json|
      json["version"]
    end
  end

  # Whinge updates itself (Sparkle), so `brew upgrade` leaves it be unless asked with --greedy.
  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "Whinge.app"
  binary "#{appdir}/Whinge.app/Contents/Helpers/whinge"
end
