$fileName = Read-Host "Enter the file name to delete"

$directory = "edited_videos"
$files = Get-ChildItem $directory | Where-Object { $_.Name -like "*$fileName*" }

if ($files.Count -gt 0) {
    foreach ($file in $files) {
        Remove-Item $file.FullName -Force
        Write-Host "File '$($file.Name)' deleted successfully."
    }
} else {
    Write-Host "No files containing '$fileName' found."
}
