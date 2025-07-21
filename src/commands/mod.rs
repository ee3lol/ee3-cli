pub mod new;
pub mod init;
pub mod mkcd;

use anyhow::Result;
use clap::Subcommand;
pub use new::execute as new_execute;
pub use mkcd::execute as mkcd_execute;
use crate::shell;

pub fn init_execute() -> Result<()> {
    shell::setup_shell_function()?;
    Ok(())
}

#[derive(Debug, Subcommand)]
pub enum Command {
    New {
        name: String,
    },
    
    Init,
    
    Mkcd {
        path: String,
    },
    
    Help,
}
