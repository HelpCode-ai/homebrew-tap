# AnythingMCP Homebrew tap

Homebrew formulas from [AnythingMCP](https://anythingmcp.com), the open-source MCP gateway ([GitHub](https://github.com/HelpCode-ai/anythingmcp)).

## amcp: the AnythingMCP command line

```bash
brew install helpcode-ai/tap/amcp
```

Or tap first, then install:

```bash
brew tap helpcode-ai/tap
brew install amcp
```

Then sign in to your AnythingMCP server (Cloud or self-hosted):

```bash
amcp login --browser --url https://cloud.anythingmcp.com
amcp tools ls
```

`amcp --help` lists every command.

Shell completions for bash, zsh and fish are installed with the formula.

The CLI is also on npm as [`@anythingmcp/cli`](https://www.npmjs.com/package/@anythingmcp/cli). Its documentation is at [anythingmcp.com/developers](https://anythingmcp.com/developers).

## Updates

A daily workflow checks npm for a new `@anythingmcp/cli` release, points the formula at it, installs and tests it, and commits the change. `brew upgrade amcp` then picks it up.

## License

The formulas in this repository are under the BSD 2-Clause license, like Homebrew's. The `amcp` CLI itself is AGPL-3.0-only.
