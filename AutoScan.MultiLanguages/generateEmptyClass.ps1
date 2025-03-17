# Create C# empty class file named Class and appending the number to the file name
# Usage: .\generateEmptyClass.ps1 -number 1

param (
    [int]$number
)

for ($i = 1; $i -le $number; $i++) {
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
