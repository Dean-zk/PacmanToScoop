function Run-Pacman {
    param (
        [string]$Args
    )

    switch -Wildcard ($Args) {
        "-Syu" {
            scoop update
            break
        }
        "-S *" {
            $packageName = $Args.Substring(3).Trim()
            Invoke-Expression "scoop install $packageName"
            break
        }
        "-R *" {
            $packageName = $Args.Substring(3).Trim()
            Invoke-Expression "scoop uninstall $packageName"
            break
        }
        "-Q" {
            scoop list
            break
        }
        "-Qi *" {
            $packageName = $Args.Substring(4).Trim()
            Invoke-Expression "scoop info $packageName"
            break
        }
        "-Qs *" {
            $query = $Args.Substring(4).Trim()
            Invoke-Expression "scoop search $query"
            break
        }
        
        "-Si *" {
            $packageName = $Args.Substring(4).Trim()
            Invoke-Expression "scoop info $packageName"
            break
        }
        default {
            Write-Host "Unsupported pacman command: $Args"
            break
        }
    }
}

Set-Alias -Name pacman -Value Run-Pacman
