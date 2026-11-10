class Amcp < Formula
  desc "Command-line client for AnythingMCP, the open-source MCP gateway"
  homepage "https://anythingmcp.com"
  url "https://registry.npmjs.org/@anythingmcp/cli/-/cli-0.1.5.tgz"
  sha256 "363e9d8487dd182ac7f84ca44aad4b656f992910234a1c2d652a0e60d9eaddb9"
  license "AGPL-3.0-only"

  depends_on "node"

  # npm downloads the CLI's dependencies while building.
  allow_network_access! :build

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")

    generate_completions_from_executable(bin/"amcp", "completion")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/amcp --version")

    # The management API catalogue ships with the CLI, so this works offline.
    assert_match %r{GET\s+/api/connectors}, shell_output("#{bin}/amcp api --list connectors")

    # Without a saved profile the CLI must refuse with a clear error and exit code 2.
    assert_match "Profile not found", shell_output("#{bin}/amcp whoami 2>&1", 2)

    # A server that cannot be reached is reported with exit code 4. Port 1 is
    # never open, and the test's network sandbox refuses the connection anyway.
    ENV["AMCP_URL"] = "http://127.0.0.1:1"
    ENV["AMCP_SERVER"] = "test"
    ENV["AMCP_API_KEY"] = "mcp_test"
    assert_match "Could not connect", shell_output("#{bin}/amcp tools ls 2>&1", 4)
  end
end
