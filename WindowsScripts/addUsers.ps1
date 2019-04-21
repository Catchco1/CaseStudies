$ADUsers = Import-csv C:\exerciseUsers.csv

foreach($User in $ADUsers)
{
    $username = $User.first.ToLower()[0] + $User.last.ToLower()
    $password = $User.Password
    $fullName = $User.first + ' ' + $User.last
    if($User.Role -eq "IT Staff" -or $User.Role -eq "Production"){
        New-ADUser -Name $fullName `
        -AccountPassword(ConvertTo-SecureString $password -AsPlainText -Force) `
        -DisplayName $fullName `
        -Enabled $true `
        -SamAccountName $username `
        -givenname $User.first `
        -surname $User.last `
        -userprincipalname ($username + "@production.team2.tu")
        if($User.Role -eq "IT Staff"){
            Add-ADGroupMember -Identity "Domain Admins" -Member $username
        }
    }
}