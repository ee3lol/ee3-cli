# 🚀 EE3 CLI Tool

A CLI tool built with all the tools and tech I swear by (until they break and I cry into my keyboard). It’s fast, kinda smart, and occasionally does exactly what I expect it to.

Built for developers who love clean workflows, efficient commands, and pretending everything is under control.

Use it. Break it. Blame the tool. Repeat.

## ✨ Features

- 🎯 Simple and intuitive commands
- 🚀 Blazing fast performance
- 🛠️ Cross-platform support (Windows, macOS, Linux)
- 🔌 Extensible architecture
- 🎨 Beautiful terminal output

## 📦 Installation

### Prerequisites

- Rust (latest stable version recommended)
- Cargo (Rust's package manager)

#### Windows

1. **Install Rust**
   - Download and run the installer from [rustup.rs](https://rustup.rs/)
   - Or using Chocolatey:
     ```powershell
     choco install rustup
     ```

2. **Clone the repository**
   ```powershell
   git clone https://github.com/ee3lol/ee3-cli.git
   cd ee3-cli
   ```

3. **Build and install**
   ```powershell
   cargo install --path .
   ```

#### macOS

1. **Install Rust**
   ```bash
   curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
   ```
   Follow the on-screen instructions to add Rust to your PATH.

2. **Clone the repository**
   ```bash
   git clone https://github.com/ee3lol/ee3-cli.git
   cd ee3-cli
   ```

3. **Build and install**
   ```bash
   cargo install --path .
   ```

#### Linux

1. **Install Rust**
   ```bash
   curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
   ```
   Follow the on-screen instructions to add Rust to your PATH.

2. **Install build dependencies**
   - For Debian/Ubuntu:
     ```bash
     sudo apt update
     sudo apt install -y build-essential
     ```
   - For Fedora:
     ```bash
     sudo dnf groupinstall "Development Tools"
     ```

3. **Clone the repository**
   ```bash
   git clone https://github.com/ee3lol/ee3-cli.git
   cd ee3-cli
   ```

4. **Build and install**
   ```bash
   cargo install --path .
   ```

## 🚀 Usage

```bash
# Show help
$ ee3 --help

# Display version
$ ee3 -v

# Create a new project
$ ee3 new my-awesome-project

# Show help for a specific command
$ ee3 help new
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

Thanks goes to these wonderful people:

<!-- Contributors START -->
<style>
  .contributor-avatar {
    width: 100px;
    height: 100px;
    border-radius: 50%;
    object-fit: cover;
    border: 3px solid #2f80ed;
    transition: transform 0.3s ease;
  }
  .contributor-avatar:hover {
    transform: scale(1.1);
  }
  .contributor-cell {
    padding: 10px;
    text-align: center;
  }
  .contributor-name {
    margin: 5px 0 0;
    font-weight: 600;
  }
</style>

<div id="contributors-container">
  <!-- This will be populated by the GitHub Action -->
  <p>Loading contributors...</p>
</div>

<!-- This script will be used to fetch and display contributors -->
<script>
  // This script will be replaced by the GitHub Action
  // It's here just as a fallback for local viewing
  const contributors = [
    {
      login: 'ee3lol',
      html_url: 'https://github.com/ee3lol',
      avatar_url: 'https://github.com/ee3lol.png',
      contributions: '💻'  // Default emoji for now
    }
  ];
  
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

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details

## 🙏 Acknowledgments

- Built with ❤️ and Rust
- Thanks to all contributors who have helped shape this project

---

<div align="center">
 @ee3lol | 2025
</div>
