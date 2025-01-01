$path="CN=Users, DC=ad,DC=com" # 取代 ad 和 com 成 你的AD網域
$domain="ad.com" # AD 網域
$user="AD" # 使用者開頭
$group="ADGroup" # 群族
$password="ADUserpassword" #密碼
$count=1..10 #多少？ 
foreach($i in $count) {
	$num=$i.ToString('00')
	New-AdUser -Name "$user$num" -SamAccountName "$user$num" -EmailAddress "$user$num@$domain" -Path $path -Enabled $True -PasswordNeverExpires $true -ChangePasswordAtLogon $false -AccountPassword (ConvertTo-SecureString "$password" -AsPlainText -force)
	Add-ADGroupMember -Identity "$group" -Members "$user$num"
}
