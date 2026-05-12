Add-Type -AssemblyName PresentationFramework
$f = 'c:\Users\X-37\Downloads\Windows Healing System-2026.04.26\Windows Healing System-2026.04.26\Schemas\MainWindow.xaml'
try {
    $r = [System.Xml.XmlReader]::Create([System.IO.StringReader]::new([System.IO.File]::ReadAllText($f)))
    [System.Windows.Markup.XamlReader]::Load($r) | Out-Null
    Write-Host 'XAML OK' -ForegroundColor Green
} catch {
    Write-Host "ERROR: $_" -ForegroundColor Red
}
