cask "whinge" do
  version "0.1.2"
  sha256 "923851172bfc0a3aedffeed18658f67bf7cb21766e2ac491db679cdc03354168"

  url "https://downloads.whinge.computer/releases/#{version}-923851172bfc0a3a/Whinge-#{version}.dmg"
  name "Whinge"
  desc "Record spoken feedback and annotate the screen"
  homepage "https://whinge.computer/"

  livecheck do
    url "https://downloads.whinge.computer/latest.json"
    strategy :json do |json|
      json["version"]
    end
  end

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "Whinge.app"
  binary "#{appdir}/Whinge.app/Contents/Helpers/whinge"
end
