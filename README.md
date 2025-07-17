# 🚀 EE3 CLI Tool

A modern, user-friendly command-line interface tool built with Rust. This project is designed to be fast, reliable, and easy to use across different operating systems.

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
<table>
  <tr>
    <td align="center">
      <a href="https://github.com/ee3lol">
        <img src="https://avatars.githubusercontent.com/u/ee3lol" width="100px;" alt="ee3lol"/><br />
        <sub><b>ee3lol</b></sub>
      </a><br />
      <a href="https://github.com/ee3lol/ee3-cli/commits?author=ee3lol" title="Code">💻</a>
    </td>
  </tr>
</table>
<!-- Contributors END -->

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- Built with ❤️ and Rust
- Thanks to all contributors who have helped shape this project

---

<div align="center">
 @ee3lol | 2025
</div>
