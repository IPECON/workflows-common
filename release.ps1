[CmdletBinding()]
param (
    [Parameter(Mandatory = $true)]
    [string] $Token,

    [Parameter(Mandatory = $true)]
    [string] $Repository,

    [Parameter(Mandatory = $true)]
    [string] $Owner,

    [Parameter(Mandatory = $true)]
    [string] $TagName,

    [Parameter(Mandatory = $false)]
    [bool] $AsDraft = $false
)

Install-Module PSGitHub

$secureToken = ConvertTo-SecureString $Token -AsPlainText

$preRelease = $false
if ($TagName.Contains('-')) {
    $preRelease = $true
}

New-GitHubRelease -RepositoryName $Repository -Owner $Owner -TagName $TagName -Token $secureToken -PreRelease:$preRelease -Draft:$AsDraft
