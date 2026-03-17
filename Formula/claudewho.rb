# typed: false
# frozen_string_literal: true

class Claudewho < Formula
  desc "Manage multiple Claude Code account configurations"
  homepage "https://github.com/frisble/claudewho"
  url "https://github.com/frisble/claudewho/archive/refs/tags/2.0.1.tar.gz"
  sha256 "893aa8376df6b94b91ce52f3c8fad04bda8cd832d269cb99cdbe95f928e0ae8e"
  license "MIT"
  head "https://github.com/frisble/claudewho.git", branch: "main"

  def install
    bin.install "bin/claudewho"
  end

  def caveats
    <<~EOS
      To enable account aliases, add this line to your shell config:

        For zsh (~/.zshrc):
          eval "$(claudewho shell-init)"

        For bash (~/.bashrc):
          eval "$(claudewho shell-init)"

      Then reload your shell:
        source ~/.zshrc  # or source ~/.bashrc

      Quick start:
        claudewho add work      # Create 'work' account
        claudewho add personal  # Create 'personal' account
        source ~/.zshrc         # Reload shell
        claudewho-work          # Launch Claude with 'work' account

      For more information:
        claudewho help
    EOS
  end

  test do
    assert_match "claudewho #{version}", shell_output("#{bin}/claudewho version")
    assert_match "Configured Claude accounts:", shell_output("#{bin}/claudewho list 2>&1", 0)
  end
end
