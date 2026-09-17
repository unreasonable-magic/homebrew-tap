cask "whinge" do
  version "0.1.4"
  sha256 "3a168b299bff19a1f9a1e3611d6289cf670af466c2913df3434d9c386ce51cab"

  url "https://downloads.whinge.computer/releases/#{version}-3a168b299bff19a1/Whinge-#{version}.dmg"
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
