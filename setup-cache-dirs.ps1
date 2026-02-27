# ===============================
# PowerShell script: One-shot Dev Cache Setup
# ===============================

$base = "G:\dev-cache"

# Create main folders
New-Item -Path $base -ItemType Directory -Force
New-Item -Path "$base\npm" -ItemType Directory -Force
New-Item -Path "$base\npm-global" -ItemType Directory -Force
New-Item -Path "$base\pnpm" -ItemType Directory -Force
New-Item -Path "$base\pip" -ItemType Directory -Force
New-Item -Path "$base\go-build" -ItemType Directory -Force
New-Item -Path "$base\go-mod" -ItemType Directory -Force
New-Item -Path "$base\go" -ItemType Directory -Force
New-Item -Path "$base\cargo" -ItemType Directory -Force
New-Item -Path "$base\rustup" -ItemType Directory -Force
New-Item -Path "$base\rust-target" -ItemType Directory -Force
New-Item -Path "$base\nuitka-cache" -ItemType Directory -Force

# ===============================
# NPM
# ===============================
npm config set cache "$base\npm" --global
npm config set prefix "$base\npm-global" --global

# ===============================
# PNPM
# ===============================
pnpm config set store-dir "$base\pnpm" --global
setx PNPM_STORE_DIR "$base\pnpm" /M

# ===============================
# PIP
# ===============================
setx PIP_CACHE_DIR "$base\pip" /M

# ===============================
# Go
# ===============================
setx GOCACHE "$base\go-build" /M
setx GOMODCACHE "$base\go-mod" /M
setx GOPATH "$base\go" /M

# ===============================
# Rust
# ===============================
setx CARGO_HOME "$base\cargo" /M
setx RUSTUP_HOME "$base\rustup" /M
setx CARGO_TARGET_DIR "$base\rust-target" /M

# ===============================
# Nuitka
# ===============================
setx NUITKA_CACHE_DIR "$base\nuitka-cache" /M

Write-Host "`nAll dev caches setup completed!"
Write-Host "   Please restart PowerShell/Terminal to apply the changes."
