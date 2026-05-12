Add-Type -AssemblyName PresentationFramework
$script:IsTesting = $true

# Source dependencies
$PSScriptRoot = 'c:\Users\X-37\Downloads\WindowsHealingSystem-2026.04.26\WindowsHealingSystem-2026.04.26'
. "$PSScriptRoot\Scripts\GUI\SetWindowThemeResources.ps1"
. "$PSScriptRoot\Scripts\GUI\AttachShiftClickBehavior.ps1"
. "$PSScriptRoot\Scripts\GUI\Show-MainWindow.ps1"

# We mock out what we need so it doesn't try to load everything
$script:MainWindowSchema = "$PSScriptRoot\Schemas\MainWindow.xaml"
$script:SharedStylesSchema = "$PSScriptRoot\Schemas\SharedStyles.xaml"

# Try to run it but mock ShowDialog
$xaml = Get-Content -Path $script:MainWindowSchema -Raw
$reader = [System.Xml.XmlReader]::Create([System.IO.StringReader]::new($xaml))
$window = [System.Windows.Markup.XamlReader]::Load($reader)

SetWindowThemeResources -window $window -usesDarkMode $true

Write-Host "Window loaded"
