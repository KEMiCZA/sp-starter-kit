Param(
    [Parameter(Mandatory = $false, Position = 1)]
    [string]$TenantUrl,

    [Parameter(Mandatory = $true, Position = 2)]
    [string]$Username,

    [Parameter(Mandatory = $true, Position = 3)]
    [string]$Password,

    [Parameter(Mandatory = $false, Position = 4)]
    [string]$StockAPIKey = ""
)    

$secPassword = ConvertTo-SecureString -String $Password -AsPlainText -Force
$creds = New-Object System.Management.Automation.PSCredential ($Username, $secPassword)
# Import-Module .\PnPPowerShell\SharePointPnPPowerShellOnline\SharePointPnPPowerShellOnline.psd1
.\deploy.ps1 -TenantUrl $TenantUrl -SitePrefix "" -Credentials $creds -StockAPIKey $StockAPIKey -SkipPowerShellInstall -SkipSiteCreation
