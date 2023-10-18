#oh-my-posh init pwsh | Invoke-Expression
oh-my-posh init pwsh --config "$Env:LOCALAPPDATA\Programs\oh-my-posh\themes\jandedobbeleer.omp.json" | Invoke-Expression
#Invoke-Expression (&starship init powershell)

# Set-Alias lvim 'C:\Users\DEll\.local\bin\lvim.ps1'
Set-Alias vim lvim
Set-Alias lzg lazygit

function SetProxy(){
  $Env:http_proxy="http://127.0.0.1:7890";$Env:https_proxy="http://127.0.0.1:7890"
}
function UnsetProxy(){
  Remove-Item Env:http_proxy;Remove-Item Env:https_proxy
}
function TestProxy(){
  curl ipinfo.io
}
Set-Alias px SetProxy
Set-Alias pxu UnsetProxy
Set-Alias pxt TestProxy

$Env:EDITOR="nvim"
Set-PSReadlineOption -EditMode Vi
# 如果想区分两种模式的光标:
Set-PSReadlineOption -ViModeIndicator Cursor
Set-PSReadLineKeyHandler -Chord Ctrl+n -ViMode "Insert" -Function CopyOrCancelLine
Set-PSReadLineKeyHandler -Chord Ctrl+n -ViMode "Command" -Function CopyOrCancelLine
# Set-PSReadLineKeyHandler -Chord Ctrl+c -Function CopyOrCancelLine

Set-PSReadLineOption -PredictionSource History # 设置预测文本来源为历史记录
 
# Set-PSReadlineKeyHandler -Key Tab -Function Complete # 设置 Tab 键补全
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete # 设置 Ctrl+d 为菜单补全和 Intellisense
Set-PSReadLineKeyHandler -Key "Ctrl+z" -Function Undo # 设置 Ctrl+z 为撤销
Set-PSReadLineKeyHandler -Key "Alt+l" -Function ForwardChar # 设置 Ctrl+z 为撤销
Set-PSReadLineKeyHandler -Key "Alt+h" -Function BackwardChar # 设置 Ctrl+z 为撤销
# Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward # 设置向上键为后向搜索历史记录
# Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward # 设置向下键为前向搜索历史纪录
Set-PSReadLineKeyHandler -Key "Alt+k"  -ViMode "Command" -ScriptBlock {
[Microsoft.PowerShell.PSConsoleReadLine]::HistorySearchBackward()
[Microsoft.PowerShell.PSConsoleReadLine]::EndOfLine()
}
 
Set-PSReadLineKeyHandler -Key "Alt+j"  -ViMode "Command" -ScriptBlock {
[Microsoft.PowerShell.PSConsoleReadLine]::HistorySearchForward()
[Microsoft.PowerShell.PSConsoleReadLine]::EndOfLine()
}

Set-PSReadLineKeyHandler -Key "Alt+k"  -ScriptBlock {
[Microsoft.PowerShell.PSConsoleReadLine]::HistorySearchBackward()
[Microsoft.PowerShell.PSConsoleReadLine]::EndOfLine()
}
Set-PSReadLineKeyHandler -Key "Alt+j"  -ScriptBlock {
[Microsoft.PowerShell.PSConsoleReadLine]::HistorySearchForward()
[Microsoft.PowerShell.PSConsoleReadLine]::EndOfLine()
}

Set-PSReadLineKeyHandler -Key UpArrow -ScriptBlock {
[Microsoft.PowerShell.PSConsoleReadLine]::HistorySearchBackward()
[Microsoft.PowerShell.PSConsoleReadLine]::EndOfLine()
}
Set-PSReadLineKeyHandler -Key DownArrow -ScriptBlock {
[Microsoft.PowerShell.PSConsoleReadLine]::HistorySearchForward()
[Microsoft.PowerShell.PSConsoleReadLine]::EndOfLine()
}

Import-Module posh-git # git的自动补全
