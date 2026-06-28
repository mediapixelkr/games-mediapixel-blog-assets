$ErrorActionPreference = "Stop"

$aiToolkitDir = "C:\ai-toolkit"
$configPath = "C:\ai-toolkit\config\mp_scifi_buggy_aitk_500steps.yaml"
$outputDir = "C:\ideogram4_lora_training\mp_scifi_buggy\output_aitk\mp_scifi_buggy_aitk"

New-Item -ItemType Directory -Force -Path $outputDir | Out-Null

$timestamp = Get-Date -Format "yyyyMMdd_HHmmss"
$logPath = Join-Path $outputDir "train_mp_scifi_buggy_${timestamp}.log"

Push-Location $aiToolkitDir
try {
    $previousErrorActionPreference = $ErrorActionPreference
    $ErrorActionPreference = "Continue"

    & .\venv\Scripts\python.exe .\run.py $configPath *> $logPath
    $exitCode = $LASTEXITCODE

    $ErrorActionPreference = $previousErrorActionPreference

    if ($exitCode -ne 0) {
        Write-Host "AI Toolkit exited with code $exitCode."
        Write-Host "Log: $logPath"
        exit $exitCode
    }

    Write-Host "Training completed successfully."
    Write-Host "Log: $logPath"
}
finally {
    Pop-Location
}
