# load_env.ps1
if (Test-Path .env) {
    Get-Content .env | ForEach-Object {
        # Ignora linhas vazias ou comentários que começam com #
        if ($_ -match '^(.*?)=(.*)$' -and -not $_.StartsWith('#')) {
            $key = $Matches[1].Trim()
            $value = $Matches[2].Trim().Trim('"').Trim("'")
            [System.Environment]::SetEnvironmentVariable($key, $value, "Process")
            Write-Host "Load variable: $key" -ForegroundColor Green
        }
    }
} else {
    Write-Warning "Arquivo .env não encontrado no diretório atual!"
}