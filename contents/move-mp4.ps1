function Move-Mp4Files {
    param (
        [Parameter(Mandatory=$false)]
        [string]$SourcePath = (Read-Host -Prompt "Enter the source path (default: C:\Users\9Health\Documents\0_9HA\9h-pipelines\contents\in)"),

        [Parameter(Mandatory=$true)]
        [string]$DestinationPath = (Read-Host -Prompt "Enter the destination path (default: D:\2_Userviz\Long\0_original_video)")
    )

    # If the user input is empty, use the default value
    if ([string]::IsNullOrEmpty($SourcePath)) {
        $SourcePath = "C:\Users\9Health\Documents\0_9HA\9h-pipelines\contents\in"
    }
    if ([string]::IsNullOrEmpty($DestinationPath)) {
        $DestinationPath = "D:\2_Userviz\Long\0_original_video"
    }

    # Get all the .mp4 files in the source directory and its subdirectories
    Get-ChildItem -Path $SourcePath -Filter *.mp4 -Recurse | 
    # For each file, move it to the target path, creating the folders if needed
    ForEach-Object {
        $source = $_.FullName
        $target = $source.Replace($SourcePath, $DestinationPath)
        Move-Item -LiteralPath $source -Destination $target -Force
    }
}

# Usage example:
Move-Mp4Files
