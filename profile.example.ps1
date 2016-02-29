# Powershell profile example for posh-p4
#Zougi. 27/02/2016 

Import-Module posh-p4

function global:prompt {
    $realLASTEXITCODE = $LASTEXITCODE

    Write-Host($pwd.ProviderPath) -nonewline

    #perforce status
    Write-P4Prompt

    #uncomment the following line if you use posh-git
    #Write-VcsStatus

    $global:LASTEXITCODE = $realLASTEXITCODE
	return "> "
}
