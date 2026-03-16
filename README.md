# claude-accounts

Manage multiple Claude Code account configurations easily. Switch between work and personal accounts, or maintain separate configurations for different projects.

## Installation

### Homebrew (recommended)

```bash
brew tap YOUR_USERNAME/claude-accounts
brew install claude-accounts
```

### Manual

```bash
git clone https://github.com/YOUR_USERNAME/claude-accounts.git
cd claude-accounts
chmod +x bin/claude-accounts
sudo ln -s "$(pwd)/bin/claude-accounts" /usr/local/bin/claude-accounts
```

## Setup

Add this line to your `~/.zshrc` (or `~/.bashrc` for Bash):

```bash
eval "$(claude-accounts shell-init)"
```

Then reload your shell:

```bash
source ~/.zshrc
```

## Usage

### Create accounts

```bash
claude-accounts add work
claude-accounts add personal
claude-accounts add client-project
```

### List accounts

```bash
claude-accounts list
```

Output:
```
Configured Claude accounts:

  work                 ~/.claude-work                 (authenticated)
  personal             ~/.claude-personal             (not authenticated)
  client-project       ~/.claude-client-project       (authenticated)

Use claude-<name> or claude-accounts use <name> to launch.
```

### Launch Claude with an account

After running `source ~/.zshrc`, you can use:

```bash
# Using the alias (recommended)
claude-work
claude-personal

# Or using the command
claude-accounts use work
```

### Remove an account

```bash
claude-accounts remove personal
```

This will prompt for confirmation before deleting the account directory.

## Commands

| Command | Description |
|---------|-------------|
| `list` | List all configured accounts |
| `add <name>` | Create a new account configuration |
| `remove <name>` | Remove an account (with confirmation) |
| `use <name>` | Launch Claude with the specified account |
| `shell-init` | Print shell aliases for sourcing |
| `version` | Show version information |
| `help` | Show help message |

## How it works

- Each account is stored in `~/.claude-<name>/`
- Account names are tracked in `~/.claude-accounts.conf`
- The `shell-init` command generates aliases like `claude-work` that set `CLAUDE_CONFIG_DIR` before launching Claude
- Your original `~/.claude` directory is never modified

## Requirements

- Claude Code CLI installed (`npm install -g @anthropic-ai/claude-code`)
- Bash 4.0+ or Zsh
- macOS or Linux

## Notes

- Each account requires a separate Anthropic account (different email)
- Each account has its own usage limits
- Check [Anthropic's terms of service](https://www.anthropic.com/terms) to ensure compliance

## License

MIT
