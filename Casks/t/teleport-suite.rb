cask "teleport-suite" do
  version "18.0.2"
  sha256 "daadddc969a48d13c8064b25172e2b64a6878273c0e2653bcd76e4684cdfc7a6"

  url "https://cdn.teleport.dev/teleport-#{version}.pkg",
      verified: "cdn.teleport.dev/"
  name "Teleport"
  desc "Modern SSH server for teams managing distributed infrastructure"
  homepage "https://goteleport.com/"

  livecheck do
    url "https://goteleport.com/download/"
    regex(/teleport[._-]v?(\d+(?:\.\d+)+)\.pkg/i)
  end

  conflicts_with cask:    [
                   "teleport-suite@16",
                   "tsh",
                   "tsh@13",
                 ],
                 formula: "teleport"

  pkg "teleport-#{version}.pkg"

  uninstall pkgutil: [
              "(.*).com.gravitational.teleport.tctl",
              "(.*).com.gravitational.teleport.tsh",
              "com.gravitational.teleport",
            ],
            delete:  [
              "/usr/local/bin/fdpass-teleport",
              "/usr/local/bin/tbot",
              "/usr/local/bin/tctl",
              "/usr/local/bin/teleport",
              "/usr/local/bin/tsh",
            ]

  zap trash: "~/.tsh"
end
