$path="CN=Users, DC=ad,DC=com" # 取代 ad 和 com 成 你的AD網域 如果不只兩個可以加 DC=
$domain="ad.com" # AD 網域
$user="AD" # 使用者開頭
$count=1..10 #多少？ 
foreach($i in $count) {
 if ($i % 2 -eq 0) {
	 $num=$i.ToString('00')
	 Remove-AdUser -Identity "$user$num" -Confirm:$false 
 }
}
