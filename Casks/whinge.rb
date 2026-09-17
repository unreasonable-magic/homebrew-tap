cask "whinge" do
  version "0.1.3"
  sha256 "335f65d8759af404e7e3a0c46fff3e524ec6f3ed43f3465b9d866faa34267a67"

  url "https://downloads.whinge.computer/releases/#{version}-335f65d8759af404/Whinge-#{version}.dmg"
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
