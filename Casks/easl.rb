# Written by twaldin/easl's Release workflow (scripts/homebrew-cask.sh); the next release replaces it.
cask "easl" do
  version "0.2.4"
  sha256 "e5860372d109a02d6eb8578d3b79fe8cff5f5c6323eaffffe06b61f5874c257c"

  url "https://github.com/twaldin/easl/releases/download/v#{version}/easl-#{version}.zip"
  name "easl"
  desc "Board for coding agents: terminals, code, notes and browser tiles"
  homepage "https://easl.sh/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "easl.app"

  # Quitting keeps terminal tiles running (zmx holds their sessions); boards are saved on quit.
  uninstall quit: "net.waldin.easl"

  # docs/install.md "Uninstall": boards, the browser profile, preferences, caches and the logs zmx
  # keeps for easl's terminal sessions.
  zap trash: [
    "~/.local/state/zmx/logs/canvas-obj_*.log",
    "~/.omp/agent/extensions/easl.ts",
    "~/Library/Application Support/Easl",
    "~/Library/Application Support/Easl-stale-*",
    "~/Library/Caches/net.waldin.easl",
    "~/Library/HTTPStorages/net.waldin.easl*",
    "~/Library/Preferences/net.waldin.easl.plist",
    "~/Library/WebKit/net.waldin.easl",
  ]

  caveats <<~CAVEATS
    Terminal tiles need zmx; the easl CLI and agent integrations need bun:
      brew install neurosnap/tap/zmx oven-sh/bun/bun

    For omp, link easl's extension:
      mkdir -p ~/.omp/agent/extensions
      ln -sf #{appdir.join("easl.app/Contents/Resources/extensions/omp/easl.ts").to_s.shellescape} ~/.omp/agent/extensions/easl.ts
  CAVEATS
end
