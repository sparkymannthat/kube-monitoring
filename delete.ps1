$ns = 'loadtest'
$val = 100

1..$val | % {
     Write-Output $ns$_
     kubectl -n $ns$_ delete -f ./app-deploy.yaml
}

1..$val | % { 
     Write-Output $ns$_
     kubectl delete ns $ns$_
}
