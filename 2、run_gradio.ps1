#Run Gradio script by @bdsqlsz

$share = $false              # Enable sharing (equivalent to --share)
$server = "127.0.0.1"          # Server address
$port = ""                # Port number (leave as $null if not specified)
$inbrowser = $true          # Auto-open in browser

# ============= DO NOT MODIFY CONTENTS BELOW | 请勿修改下方内容 =====================
# Activate python venv
Set-Location $PSScriptRoot
if ($env:OS -ilike "*windows*") {
    if (Test-Path "./venv/Scripts/activate") {
        Write-Output "Windows venv"
        ./venv/Scripts/activate
    }
    elseif (Test-Path "./.venv/Scripts/activate") {
        Write-Output "Windows .venv"
        ./.venv/Scripts/activate
    }
}
elseif (Test-Path "./venv/bin/activate") {
    Write-Output "Linux venv"
    ./venv/bin/Activate.ps1
}
elseif (Test-Path "./.venv/bin/activate") {
    Write-Output "Linux .venv"
    ./.venv/bin/activate.ps1
}

$Env:HF_HOME = "huggingface"
#$Env:HF_ENDPOINT = "https://hf-mirror.com"
$Env:XFORMERS_FORCE_DISABLE_TRITON = "1"
$ext_args = [System.Collections.ArrayList]::new()

if ($share) {
    [void]$ext_args.Add("--share")
}
if ($server) {
    [void]$ext_args.Add("--server=$server")
}
if ($port) {
    [void]$ext_args.Add("--port=$port")
}
if ($inbrowser) {
    [void]$ext_args.Add("--inbrowser")
}

# run Gradio
python "./endframe.py" `
    $ext_args