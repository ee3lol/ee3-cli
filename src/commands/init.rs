use anyhow::Result;
use crate::shell;

pub fn execute() -> Result<()> {
    println!("Setting up shell integration...");
    let config_file = shell::setup_shell_function()?;
    
    println!("✓ Shell integration complete!");
    println!("\nTo use the 'ee3 mkcd' command, please run one of the following commands:");
    println!("  source {}", config_file.display());
    println!("Or restart your terminal.");
    println!("\nThen try: ee3 mkcd test");
    
    Ok(())
}
