Param(
    $Source = "\pic\capture\field",
    $Destination = (Get-Location).Path
)

$SamsungCapturePattern =
    "_(?<year>\d{4})(?<month>\d{2})(?<day>\d{2})\-"

foreach ($file in (dir $Source)) {
    $dateCapture = [Regex]::Match($file, $SamsungCapturePattern)

    if (-not $dateCapture.Success) {
        continue
    }

    $year = $dateCapture.Groups['year']
    $month = $dateCapture.Groups['month']
    $day = $dateCapture.Groups['day']
    $outFile = Join-Path `
        $Destination `
        "note_-_$($year)_$($month)_$($day)_Field.md"

    $content = @(
        "# image"
        ""
        "![SalesRabbit](./res/$file)"

    $hasImageMacro = $false

    if ((Test-Path $outFile)) {
        $formerContent = Get-Content $outFile

        $hasImageMacro =
            @($formerContent `
                | ? { $_ -match "\!\[SalesRabbit\]\(.*\)" }).Count -gt 0

        if (-not [String]::IsNullOrWhiteSpace($formerContent[-1])) {
            $content = @("") + $content
        }
    }

    if (-not $hasImageMacro) {
        $content `
            | Out-File `
                -Path $outFile `
                -Encoding utf8 `
                -Append
    }

    $res = Join-Path $Destination 'res'

    if (-not (Test-Path $res)) {
        mkdir $res
    }

    Copy-Item (Join-Path $Source $file) $res
}

