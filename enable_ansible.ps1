# Windows does not allow remote connection through winrm by default, and Ansible uses winrm for connection to windows, so this script must be manually inserted into a Windows host; only then will the playbooks in this repo function
# Approach: Download and run a PowerShell script, written by Ansible, to enable remote connection

$pathGit = "$env:USERPROFILE\Temp\ansible"
$pathChoco = "C:\ProgramData\chocolatey"

# Intsall chocolately package manager
$chocoInstalled = Test-Path $pathChoco
if (!$chocoInstalled) {
	Write-Host "Installing choco"
	Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}

choco install -y git

# Run the file that enables remote connection
git clone https://github.com/ansible/ansible.git $pathGit
& "$pathGit\examples\scripts\ConfigureRemotingForAnsible.ps1"

# Cleanup: remove choco if was not previously installed; remove the ansible repo
if (!$chocoInstalled) {
	Write-Host "Uninstalling choco, as it did not previously exist"
	Remove-Item -Force -Recurse -Path $pathChoco
}

Write-Host "Cleaning up the cloned repos"
Remove-Item -Force -Recurse -Path $pathGit
