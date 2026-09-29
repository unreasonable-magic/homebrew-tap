cask "offsider" do
  version "0.1.0"
  sha256 "4834df1db91646c2f61e27599713aa10886cadfe6fc4363d2fe5445f47269a5d"

  url "https://offsider.website/releases/#{version}-1/Offsider-#{version}.zip"
  name "Offsider"
  desc "Small HTML apps beside your work"
  homepage "https://offsider.website/"

  livecheck do
    url "https://offsider.website/appcast.xml"
    strategy :sparkle, &:short_version
  end

  # Offsider updates itself (Sparkle), so `brew upgrade` leaves it be unless asked with --greedy.
  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "Offsider.app"
  binary "#{appdir}/Offsider.app/Contents/Helpers/offsider"

  zap trash: "~/Library/Application Support/Offsider"
end
