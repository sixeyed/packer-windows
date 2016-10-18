net localgroup docker /add
$username = "vagrant"
net localgroup docker $username /add

$env:Path = $env:Path + ";$($env:ProgramFiles)\docker"
. dockerd --unregister-service
. dockerd --register-service -H npipe:// -H 0.0.0.0:2375 -G docker
