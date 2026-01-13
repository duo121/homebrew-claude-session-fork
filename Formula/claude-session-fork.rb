class ClaudeSessionFork < Formula
  desc "Fork Claude Code sessions at any conversation point"
  homepage "https://github.com/duo121/claude-session-fork"
  url "https://registry.npmjs.org/claude-session-fork/-/claude-session-fork-1.0.0.tgz"
  sha256 "563a88b4cd236ab863fe8db6a6f03a4581794e6aeff56c7b97316adec79eac07"
  license "MIT"

  def install
    libexec.install Dir["*"]
    (bin/"sfork").write_env_script libexec/"dist/cli.js", PATH: "#{HOMEBREW_PREFIX}/bin:$PATH"
    (bin/"csfork").write_env_script libexec/"dist/cli.js", PATH: "#{HOMEBREW_PREFIX}/bin:$PATH"
    (bin/"claude-session-fork").write_env_script libexec/"dist/cli.js", PATH: "#{HOMEBREW_PREFIX}/bin:$PATH"
    
    # Install npm dependencies
    system "npm", "install", "--prefix", libexec, "--production"
  end

  def caveats
    <<~EOS
      Requires Node.js 18+. Install via:
        brew install node
      Or use nvm: https://github.com/nvm-sh/nvm
    EOS
  end

  test do
    assert_match "claude-session-fork", shell_output("#{bin}/sfork --help")
  end
end
