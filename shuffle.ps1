# Ensure the filename is passed as an argument
param (
    [string]$file
)

# Check if the file exists
if (-not (Test-Path $file)) {
    Write-Host "File $file does not exist."
    exit
}

# Read the contents of the file
$lines = Get-Content $file

# Shuffle the lines
$shuffledLines = $lines | Get-Random -Count $lines.Count

# Output the shuffled lines
$shuffledLines | Set-Content $file