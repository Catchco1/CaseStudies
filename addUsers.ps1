$userFile = Read-Host -Prompt "Enter the full path to the csv containing the users"
$passFile = Read-Host -Prompt "Enter the full path to the password file"
$passList = Get-Content $passFile
$nameslist = Get-Content $userFile
$network = Read-Host -Prompt 'What network are these users on?'
ForEach ($info in $nameslist){
    $first = $info.Split(',')[0]
    $last = $info.Split(',')[1]
    $fullName = $first + ' ' + $last
    $group = $info.Split(',')[2]
    $username = $first.ToLower()[0] + $last.ToLower()
    $password = $passList | Get-Random 

    if($group -eq 'IT Staff' -or $group -eq $network){
        $username + ' ' + $password | Out-File -FilePath C:\addUsersOutput.txt -Append   
        New-ADUser -Name $fullName `
        -AccountPassowrd(ConverTo-SecureString $password -AsPlainText -Force) `
        -DisplayName $fullName
        -Enabled $true
        -SamAccountName $username
        -givenname $first
        -surname $last
        -userprincipalname ($username + "@
    }
}