$versions = Get-ChildItem -Path $args[0] -Filter "avro-tools*.jar" | ForEach-Object { $_.Name -replace "avro-tools|-|\.jar" } |
    Sort-Object { [Version]$_ } -Descending |
    Select-Object -First 1 |
    ForEach-Object { "avro-tools-$($_).jar" }
$versions
