#Usage Example
#.\deleteFiles -folder 'c:\logs' -days -7 -filetype log
param(
	[Parameter(Mandatory = $true)] [string] $folder,
	[Parameter(Mandatory = $true)] [int] $days,
	[Parameter(Mandatory = $true)] [string] $filetype
)

Get-ChildItem –Path $folder* –Recurse -Include *.$filetype | Where-Object CreationTime –lt (Get-Date).AddDays($days) | Remove-Item