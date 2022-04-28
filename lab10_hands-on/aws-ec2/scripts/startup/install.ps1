############################################# LUCAS OMENA #############################################

# HANDS-ON LABS
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs

#######################################################################################################

Set-ExecutionPolicy Bypass
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
choco install apache-httpd
choco install apache-httpd --params '"/installLocation:C:\HTTPD /port:8080"'

# Get-Package -Provider chocolatey -Force
# Install-Package adobereader, 7zip, firefox, notepadplusplus, teamviewer, vlc -Force
