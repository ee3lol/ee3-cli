pub mod new;

use clap::Subcommand;
pub use new::execute as new_execute;

#[derive(Debug, Subcommand)]
pub enum Command {
    New {
        name: String,
    },
    
    Help,
}
