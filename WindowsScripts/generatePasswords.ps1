$passwords = Get-Content C:\Users\cag10\Downloads\passwords.txt
$users = Import-Csv 'C:\Users\cag10\Downloads\Team1Employees - Team1Employees.csv'

foreach($user in $users)
{
    $username = $user.First[0] + $user.Last
    $username = $username.ToLower()

    $password = Get-Random -InputObject $passwords
    $userpass = New-Object PSObject -Property @{
        username = $username
        password = $password
    }
    Export-Csv -InputObject $userpass -Path C:\Users\cag10\Downloads\userPasswords.csv -Append
}