class ClaudeSessionFork < Formula
  desc "Fork Claude Code sessions at any conversation point"
  homepage "https://github.com/duo121/claude-session-fork"
  url "https://registry.npmjs.org/claude-session-fork/-/claude-session-fork-1.0.0.tgz"
  sha256 "563a88b4cd236ab863fe8db6a6f03a4581794e6aeff56c7b97316adec79eac07"
  license "MIT"

  # Don't depend on homebrew node, use system node
  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  def caveats
    <<~EOS
      Requires Node.js 18+. Install via nvm or from https://nodejs.org
    EOS
  end

  test do
    assert_match "claude-session-fork", shell_output("#{bin}/sfork --help")
  end
end
