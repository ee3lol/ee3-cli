use anyhow::{Context, Result};

pub fn execute(path: &str) -> Result<()> {
    std::fs::create_dir_all(path)
        .with_context(|| format!("Failed to create directory: {}", path))?;
    println!("Created directory: {}", path);
    Ok(())
}
