$ns = 'loadtest'
$val = 100

1..$val | % { 
     Write-Output $ns$_
     kubectl create ns $ns$_
     kubectl -n $ns$_ apply -f ./app-deploy.yaml
}
