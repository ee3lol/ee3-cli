use std::io;
use std::path::Path;

pub fn execute(name: &str) -> io::Result<()> {
    if name.is_empty() {
        return Err(io::Error::new(
            io::ErrorKind::InvalidInput,
            "Project name cannot be empty",
        ));
    }
    
    if Path::new(name).exists() {
        return Err(io::Error::new(
            io::ErrorKind::AlreadyExists,
            format!("Directory '{}' already exists", name),
        ));
    }
    
    println!("🚧  Coming soon! Will generate a new project named: {}", name);
    
    Ok(())
}

#[cfg(test)]
mod tests {
    use super::*;
    use tempfile::tempdir;

    #[test]
    fn test_execute_with_valid_name() {
        let result = execute("test_project");
        assert!(result.is_ok());
    }
    
    #[test]
    fn test_execute_with_empty_name() {
        let result = execute("");
        assert!(result.is_err());
        assert_eq!(result.unwrap_err().kind(), io::ErrorKind::InvalidInput);
    }
    
    #[test]
    fn test_execute_with_existing_directory() {
        let temp_dir = tempdir().unwrap();
        let dir_name = temp_dir.path().file_name().unwrap().to_str().unwrap();
        
        let result = execute(dir_name);
        assert!(result.is_err());
        assert_eq!(result.unwrap_err().kind(), io::ErrorKind::AlreadyExists);
    }
}
