if (Get-Module posh-p4) { return }

Push-Location $psScriptRoot
. ./P4Prompt.ps1
. ./P4TabExpansion.ps1
Pop-Location

Export-ModuleMember -Function @(
        'TabExpansion',
        'Write-P4Prompt')