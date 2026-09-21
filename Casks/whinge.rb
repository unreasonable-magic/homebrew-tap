cask "whinge" do
  version "0.1.6"
  sha256 "e7c46f73286754d30b34b6527d973dade8a08999a35296f52701ec4b55c83ce5"

  url "https://downloads.whinge.computer/releases/#{version}-e7c46f73286754d3/Whinge-#{version}.dmg"
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
