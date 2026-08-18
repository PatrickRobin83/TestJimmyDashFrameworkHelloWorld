# -----------------------------------------------------------------------------
#   Filename          : build.ps1
#   Created By        : Erik (techlead) — Tech Lead Entwicklung
#   Created On        : 2026-08-18
#   Last Modified By  : Erik (techlead)
#   Last Modified On  : 2026-08-18
#   Beschreibung      : Build- + Smoke-Test-Skript für Windows-Entwickler
#                       (PowerShell-Spiegel von build.sh). Führt 'dotnet build'
#                       aus und verifiziert danach 'dotnet run' → "Hello, World!".
#   Nutzung           : .\build.ps1   (in PowerShell, aus dem Projektordner)
#   Exit-Codes        : 0 = OK; sonst Fehler.
# -----------------------------------------------------------------------------

$ErrorActionPreference = "Stop"

# --- dotnet lokal finden, falls nicht im PATH --------------------------------
if (-not (Get-Command dotnet -ErrorAction SilentlyContinue)) {
  $dotnetBin = Join-Path ${env:DOTNET_ROOT} "dotnet.exe"
  if (-not $env:DOTNET_ROOT) { $dotnetBin = "C:\Program Files\dotnet\dotnet.exe" }
  if (-not (Test-Path $dotnetBin)) {
    Write-Error "dotnet nicht gefunden. SDK installieren bzw. DOTNET_ROOT setzen (siehe README 'Installationsweg')."
    exit 1
  }
  $env:PATH = "$(Split-Path $dotnetBin);$env:PATH"
  Write-Host "dotnet nicht im PATH -> nutze $dotnetBin"
}

Write-Host "dotnet: $(Get-Command dotnet | Select-Object -ExpandProperty Source) ($(& dotnet --version))"
Write-Host "Project: $((Get-Location | Split-Path -Leaf))"

# --- Build -------------------------------------------------------------------
Write-Host "dotnet build ..."
& dotnet build --nologo
if ($LASTEXITCODE -ne 0) { Write-Error "Build fehlgeschlagen (Exit $LASTEXITCODE)"; exit $LASTEXITCODE }

# --- Smoke-Test --------------------------------------------------------------
Write-Host "Smoke-Test (dotnet run --no-build) ..."
$out = (& dotnet run --no-build).Trim()
Write-Host "  Ausgabe: '$out'"
if ($out -ne "Hello, World!") {
  Write-Error "Smoke-Test fehlgeschlagen: erwartet 'Hello, World!', erhalten '$out'"
  exit 1
}

Write-Host "Build OK + Smoke-Test bestanden."
