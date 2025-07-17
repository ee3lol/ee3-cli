mod commands;

use clap::{CommandFactory, Parser};
use clap::builder::styling::{AnsiColor, Styles};

use crate::commands::{Command, new_execute};

fn get_styles() -> Styles {
    Styles::styled()
        .header(AnsiColor::Green.on_default())
        .usage(AnsiColor::Green.on_default())
        .literal(AnsiColor::Blue.on_default())
        .placeholder(AnsiColor::Cyan.on_default())
}

#[derive(Debug, Parser)]
#[command(
    name = "ee3.lol",
    about = "EE3 CLI Tool - I made this for fun :3",
    version = "0.1.0",
    styles = get_styles(),
    disable_help_subcommand = true,
    disable_version_flag = true,    
    arg_required_else_help = false,
    help_template = "{before-help}{name} v{version}
{about-section}
{usage-heading} {usage}

{all-args}{after-help}",
    after_help = "Run 'ee3 <command> --help' for more information on a command."
)]
struct Cli {
    #[arg(short = 'v', long = "version", help = "Print version")]
    version: bool,
    
    #[command(subcommand)]
    command: Option<Command>,
}

fn handle_help() -> Result<(), String> {
    let mut cmd = Cli::command();
    cmd.print_help().map_err(|e| e.to_string())?;
    println!();
    Ok(())
}

fn handle_command(cmd: Command) -> Result<(), String> {
    match cmd {
        Command::New { name } => {
            new_execute(&name)
                .map_err(|e| e.to_string())
        },
        Command::Help => {
            handle_help()?;
            Ok(())
        },
    }
}

fn main() {
    let cli = Cli::parse();
    
    if cli.version {
        println!("ee3.lol v0.1.0");
        return;
    }
    
    let result = match cli.command {
        Some(cmd) => handle_command(cmd),
        None => {
            println!("hello :3");
            Ok(())
        }
    };
    
    if let Err(e) = result {
        eprintln!("Error: {}", e);
        std::process::exit(1);
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use assert_cmd::Command;
    use predicates::prelude::*;

    #[test]
    fn test_no_args() {
        let mut cmd = Command::cargo_bin("ee3").unwrap();
        cmd.assert()
            .success()
            .stdout(predicate::str::contains("hello :3"));
    }

    #[test]
    fn test_help() {
        let mut cmd = Command::cargo_bin("ee3").unwrap();
        cmd.arg("--help")
            .assert()
            .success()
            .stdout(predicate::str::contains("EE3 CLI Tool"));
    }
}
