# Create C# empty class file named Class and appending the number to the file name
# Usage: .\generateEmptyClass.ps1 -number 1

param (
    [int]$number
)

# Get the highest existing class file number
$existingFiles = Get-ChildItem -Filter 'Class*.cs' | Select-Object -ExpandProperty Name
$maxNumber = 0

foreach ($file in $existingFiles) {
    if ($file -match 'Class(\d+)\.cs') {
        $num = [int]$matches[1]
        if ($num -gt $maxNumber) {
            $maxNumber = $num
        }
    }
}

for ($i = $maxNumber + 1; $i -le $maxNumber + $number; $i++) {
    $className = "Class$i"
    $fileName = "$className.cs"
    $content = @"
using System;

namespace AutoScan.MultiLanguages
{
    public class $className
    {
    }
}
"@
    Set-Content -Path $fileName -Value $content
    Write-Output "Created $fileName"
}
