function Sap-Flags {
    param (
        [string]$Args
    )

    $command, $packageName = $Args.Split(" ", 2)

    switch -Wildcard ($command) {
        "-Syu" {
            scoop update
            
            if (![string]::IsNullOrWhiteSpace($packageName)) {
                if ($packageName -eq "emacs") {
                    Invoke-Expression "scoop install neovim"
                }
                else {
                    Invoke-Expression "scoop install $packageName"
                }
            }
            
            break
        }
        "-S" {
            $packageName = $Args.Substring(3).Trim()
            if ($packageName -eq "emacs") {
                    Invoke-Expression "scoop install neovim"
                }
                else {
                    Invoke-Expression "scoop install $packageName"
                }

            break
        }
        "-R" {
            $packageName = $Args.Substring(3).Trim()
            Invoke-Expression "scoop uninstall $packageName"
            break
        }
        "-Q" {
            scoop list
            break
        }
        "-Qi" {
            $packageName = $Args.Substring(4).Trim()
            Invoke-Expression "scoop info $packageName"
            break
        }
        "-Qs" {
            $query = $Args.Substring(4).Trim()
            Invoke-Expression "scoop search $query"
            break
        }
        "-Si" {
            $packageName = $Args.Substring(4).Trim()
            Invoke-Expression "scoop info $packageName"
            break
        }
        "-Px" {
            $packageName = $Args.Substring(4).Trim()
            Invoke-Expression "scoop prefix $packageName"
            break
        }
        "-Ds" {
            $packageName = $Args.Substring(4).Trim()
            Invoke-Expression "scoop depends $packageName"
            break
        }
        
        "-H" {
            $packageName = $Args.Substring(4).Trim()
            Invoke-Expression "scoop checkup $packageName"
            break
        }
        "-Ce" {
            $packageName = $Args.Substring(4).Trim()
            Invoke-Expression "scoop cache"
            break
        }
        "-Purr" {
            $packageName = $Args.Substring(4).Trim()
            Invoke-Expression "scoop cat $packageName"
            break
        }
        "-Rt" {
            $packageName = $Args.Substring(4).Trim()
            Invoke-Expression "scoop reset $packageName"
            break
        }
        "-Np" {
            notepad
            if (![string]::IsNullOrWhiteSpace($packageName)) {
                Invoke-Expression "notepad $packageName"
            }
            break
        }
        "-V" {
            vim
            if (![string]::IsNullOrWhiteSpace($packageName)) {
                Invoke-Expression "vim $packageName"
            }
            break
        }
        "-Nv" {
            nvim
            if (![string]::IsNullOrWhiteSpace($packageName)) {
                Invoke-Expression "nvim $packageName"
            }
            break
        }

        default {
            Write-Host "Not a valid SAP flag: $command"
            break
        }
    }
}

Set-Alias -Name sap -Value Sap-Flags
# For people who don't understand:
# I removed the ability to download Emacs with sap.
# Why? Because F*ck Emacs >:(
# Learn a text editor, you already have a OS.
Set-Alias -Name emacs -Value nvim
