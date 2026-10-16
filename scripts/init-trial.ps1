<#
.SYNOPSIS
Create a private, local-only experimental run metadata file.
.DESCRIPTION
No log collection, networking, API requests, or public repo writes. Does not include source code or prompts.
.EXAMPLE
.\scripts\init-trial.ps1 -Model 'radeon:DeepSeek-V4-Flash' -TaskClass medium
#>
[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)][ValidateNotNullOrEmpty()][string]$Model,
    [ValidateSet('short', 'medium', 'long')][string]$TaskClass = 'short',
    [string]$PrivateRoot = (Join-Path $HOME '.dsh-lab-private\runs')
)

$ErrorActionPreference = 'Stop'
$created = (Get-Date).ToUniversalTime()
$runId = '{0}-{1}' -f $created.ToString('yyyyMMdd-HHmmss'), ([guid]::NewGuid().ToString('N').Substring(0, 8))
$runPath = Join-Path $PrivateRoot $runId
New-Item -ItemType Directory -Path $runPath -Force | Out-Null

$record = [ordered]@{
    schemaVersion = 1
    runId = $runId
    createdAtUtc = $created.ToString('o')
    model = $Model
    taskClass = $TaskClass
    status = 'pending'
    agentTurnCompleted = $null
    taskAccepted = $null
    notes = 'PRIVATE: fill only with metadata; do not copy secrets, private prompts or source code.'
}

$destination = Join-Path $runPath 'experiment.json'
$record | ConvertTo-Json -Depth 4 | Set-Content -LiteralPath $destination -Encoding UTF8
Write-Host ('Private run created: {0}' -f $destination)
Write-Host 'This tool does not collect sessions or change DSH settings.'
