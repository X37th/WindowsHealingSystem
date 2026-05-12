Add-Type -AssemblyName PresentationFramework
$xamlPath = 'c:\Users\X-37\Downloads\WindowsHealingSystem-2026.04.26\WindowsHealingSystem-2026.04.26\Schemas\SharedStyles.xaml'
$mainPath  = 'c:\Users\X-37\Downloads\WindowsHealingSystem-2026.04.26\WindowsHealingSystem-2026.04.26\Schemas\MainWindow.xaml'

foreach ($file in @($xamlPath, $mainPath)) {
    $name = Split-Path $file -Leaf
    try {
        $xml = Get-Content $file -Raw
        $reader = [System.Xml.XmlReader]::Create([System.IO.StringReader]::new($xml))
        [System.Windows.Markup.XamlReader]::Load($reader) | Out-Null
        Write-Host "XAML OK  $name" -ForegroundColor Green
    } catch {
        Write-Host "XAML ERR $name`: $($_.Exception.Message)" -ForegroundColor Red
    }
}
