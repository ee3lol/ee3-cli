# 🚀 EE3 CLI Tool

A powerful CLI tool built with Rust that helps developers be more productive with smart shell integration and useful utilities.

## ✨ Features

- 🚀 **Smart Shell Integration** - Automatically detects and configures your shell (Zsh, Bash, Fish)
- 📁 **Directory Management** - Create and navigate to directories in one command with `mkcd`
- 🛠️ **Cross-platform** - Works on Windows, macOS, and Linux
- ⚡ **Blazing Fast** - Built with Rust for maximum performance
- 🔌 **Extensible** - Easy to add new commands and functionality

## 🛠 Development

### Prerequisites

- Rust (latest stable version recommended)
- Cargo (Rust's package manager)

### Building from Source

1. Clone the repository:
   ```bash
   git clone https://github.com/ee3lol/ee3-cli.git
   cd ee3-cli
   ```

2. Build in development mode:
   ```bash
   cargo build
   ```

3. Run the built binary:
   ```bash
   cargo run -- --help
   ```

### Running Tests

```bash
cargo test
```

### Linting

```bash
cargo clippy
```

### Formatting

```bash
cargo fmt
```

## 🚀 Getting Started

### Installation

1. **Install Rust** (if you haven't already):
   ```bash
   curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
   ```

2. **Install EE3 CLI**:
   ```bash
   cargo install --git https://github.com/ee3lol/ee3-cli.git
   ```

3. **Initialize shell integration**:
   ```bash
   ee3 init
   source ~/.zshrc  # or ~/.bashrc, ~/.config/fish/config.fish
   ```

## 🛠 Usage

```bash
# Initialize shell integration (required for mkcd)
ee3 init

# Create and navigate to a new directory
ee3 mkcd new-project

# Show help
ee3 --help
```

## 🛠 Development

### Building from Source

1. Clone the repository:
   ```bash
   git clone https://github.com/ee3lol/ee3-cli.git
   cd ee3-cli
   ```

2. Build in development mode:
   ```bash
   cargo build
   ```

3. Run the built binary:
   ```bash
   cargo run -- --help
   ```

### Running Tests

```bash
cargo test
```

### Linting

```bash
cargo clippy
```

### Formatting

```bash
cargo fmt
```

## 🤝 Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository
2. Create a new branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 👥 Contributors

Thanks to these amazing people who have contributed to the project:

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore-start -->
<!-- markdownlint-disable -->
<table>
  <tr>
    <td align="center"><a href="https://github.com/ee3lol"><img src="https://avatars.githubusercontent.com/u/ee3lol" width="100px;" alt=""/><br /><sub><b>EE3</b></sub></a><br /><a href="https://github.com/ee3lol/ee3-cli/commits?author=ee3lol" title="Code">💻</a></td>
  </tr>
</table>
<!-- markdownlint-restore -->
<!-- prettier-ignore-end -->
<!-- ALL-CONTRIBUTORS-LIST:END -->

This project follows the [all-contributors](https://github.com/all-contributors/all-contributors) specification. Contributions of any kind welcome!
  
  const container = document.getElementById('contributors-container');
  if (container) {
    container.innerHTML = `
      <table>
        <tr>
          ${contributors.map(contributor => `
            <td class="contributor-cell">
              <a href="${contributor.html_url}" target="_blank">
                <img 
                  class="contributor-avatar"
                  src="${contributor.avatar_url}" 
                  alt="${contributor.login}"
                  title="${contributor.login}"
                />
                <p class="contributor-name">${contributor.login}</p>
              </a>
              <a href="https://github.com/ee3lol/ee3-cli/commits?author=${contributor.login}" title="Code">
                ${contributor.contributions}
              </a>
            </td>
          `).join('')}
        </tr>
      </table>
    `;
  }
</script>
<!-- Contributors END -->

> 💡 The contributors list is automatically updated using GitHub Actions. New contributors will appear here after their first contribution.

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- Built with ❤️ and Rust
- Thanks to all contributors who have helped shape this project

---

<div align="center">
 @ee3lol | 2025
</div>
