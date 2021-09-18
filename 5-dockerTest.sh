echo curl $(hostname):8081
curl $(hostname):8081

echo  ""

echo curl $(hostname):8082
curl $(hostname):8082

echo  ""
echo LB: curl $(hostname):80
curl $(hostname):80

echo  ""
echo LB: curl $(hostname):80
curl $(hostname):80
echo  ""
echo  ""
echo  "   "
