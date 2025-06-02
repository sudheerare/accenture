##assigning values to the variables

$rg = "crmt-eastus2-pprd-DB-u7crg1d1-rg"
$lbname = "crmt-eastus2-pprd-db-u7crg1d1-lb"
$lbrname = samplelbrule
$port = 9999
$probename = sample1



###frontend ip config

$lbd = Get-AzureRmLoadBalancer -Name $lbname -ResourceGroupName $rg
$fipc = $slb.FrontendIpConfigurations
$fname = $fipc.Name


###backend ip config
$bpd = Get-AzureRmLoadBalancer -Name $lbname -ResourceGroupName $rg
$bp=$bpd.BackendAddressPools
$bname = $bp.Name


##Adding probe
Get-AzLoadBalancer -Name $lbname -ResourceGroupName $rg | Add-AzLoadBalancerProbeConfig -Name $probename -Protocol http -Port $port -IntervalInSeconds 20 -ProbeCount 3 | Set-AzLoadBalancer

 
##adding LB rule
$LBRule1=New-AzureRmLoadBalancerRuleConfig -Name $lbrname  -FrontendIpConfigurationName $fname -BackendAddressPoolName $bname -ProbeName $probename -Protocol Tcp -FrontendPort $port -BackendPort $port








