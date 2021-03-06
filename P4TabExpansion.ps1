<#
.SYNOPSIS
  perforce tab completion for windows powershell
.DESCRIPTION
  posh-p4 Module:
  Bring tab auto completion (/tab expansion) for windows powershell. type p4, press tab, auto complete is there
.NOTES
  Author: Frederic ROUSSEAU
#>

#list of p4 commands
$script:p4Cmd = @(
    'add'         
    'annotate'
    'attribute'
    'branch'
    'branches'
    'change'
    'changes'
    'changelist'
    'changelists'
    'clean'
    'client'
    'clients'
    'copy'
    'counter'
    'counters'
    'cstat'
    'delete'
    'depot'
    'depots'
    'describe'
    'diff'
    'diff2'
    'dirs'
    'edit'
    'filelog'
    'files'
    'fix'
    'fixes'
    'flush'
    'fstat'
    'grep'
    'group'
    'groups'      
    'have'
    'help'
    'info'
    'integrate'
    'integrated'
    'interchanges'
    'istat'
    'job'
    'jobs'        
    'key'
    'keys'        
    'label'       
    'labels'      
    'labelsync'   
    'list'
    'lock'
    'logger'      
    'login'
    'logout'
    'merge'
    'move'
    'opened'
    'passwd'
    'populate'
    'print'
    'protect'
    'protects'
    'prune'
    'rec'
    'reconcile'
    'rename'
    'reopen'
    'resolve'
    'resolved'
    'revert'
    'review'
    'reviews'
    'set'
    'shelve'
    'status'
    'sizes'
    'stream'
    'streams'
    'submit'
    'sync'
    'tag'
    'tickets'
    'unlock'
    'unshelve'
    'update'
    'user'
    'users'
    'where'
    'workspace'
    'workspaces'  
)

#powershell function to act on tab key
function TabExpansion($line, $lastWord) {
    $lastBlock = [regex]::Split($line, '[|;]')[-1].TrimStart()
    $words = $lastBlock.Split(' ')
	#we only care about commands that start with "p4 "
    if ($words[0] -eq "p4") {
	    # give tab completion for p4 <tab> and p4 help <tab>
        if ($words.length -eq 2 -or (($words.length -eq 3) -and ($words[1] -eq "help")) ) {
		    #match also p4 <letter><tab>
            return $script:p4Cmd | ? { $_ -like "$lastWord*" }
        }
    }
}

