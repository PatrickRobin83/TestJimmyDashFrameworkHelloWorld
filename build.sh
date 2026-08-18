#!/usr/bin/env bash
# -----------------------------------------------------------------------------
#   Filename          : build.sh
#   Created By        : Erik (techlead) — Tech Lead Entwicklung
#   Created On        : 2026-08-18
#   Last Modified By  : Erik (techlead)
#   Last Modified On  : 2026-08-18
#   Beschreibung      : Build- + Smoke-Test-Skript für das C#-Hello-World-Projekt.
#                       Führt 'dotnet build' aus und verifiziert danach den Lauf
#                       ('dotnet run' → erwartet "Hello, World!").
#                       Setzt den dotnet-PATH automatisch, falls .NET SDK nicht
#                       im PATH ist (Standard: /data/.dotnet, siehe README).
#   Nutzung           : bash build.sh
#   Exit-Codes        : 0 = Build OK + Smoke-Test bestanden; 1 = Fehler.
# -----------------------------------------------------------------------------

set -euo pipefail

# --- dotnet lokal finden, falls nicht im PATH --------------------------------
if ! command -v dotnet >/dev/null 2>&1; then
  DOTNET_BIN="${DOTNET_ROOT:-/data/.dotnet}/dotnet"
  if [ -x "$DOTNET_BIN" ]; then
    export PATH="$(dirname "$DOTNET_BIN"):$PATH"
    echo "▸ dotnet nicht im PATH → nutze $DOTNET_BIN"
  else
    echo "❌ dotnet nicht gefunden. SDK installieren bzw. PATH setzen (siehe README 'Installationsweg')." >&2
    exit 1
  fi
fi

echo "▸ dotnet: $(command -v dotnet) ($(dotnet --version))"
echo "▸ Project: $(basename "$(pwd)")"

# --- Build -------------------------------------------------------------------
echo "▸ dotnet build ..."
dotnet build --nologo

# --- Smoke-Test: Standardlauf ------------------------------------------------
echo "▸ Smoke-Test (dotnet run --no-build) ..."
OUT="$(dotnet run --no-build)"
echo "  Ausgabe: '$OUT'"
if [ "$OUT" != "Hello, World!" ]; then
  echo "❌ Smoke-Test fehlgeschlagen: erwartet 'Hello, World!', erhalten '$OUT'" >&2
  exit 1
fi

echo "✅ Build OK + Smoke-Test bestanden."
