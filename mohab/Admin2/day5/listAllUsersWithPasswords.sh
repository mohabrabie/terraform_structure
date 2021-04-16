#!/bin/bash
names=$( awk -F: '{if($3>=1000 &&$3<=2000){print $1}}' /etc/passwd )
if [ -f usersFile ];then
	rm usersFile
fi

for name in  $names
do
	password=$( awk -F: "{if(\$1==\"$name\"){print \$2}}" /etc/shadow )
	$(awk -F: "{if(\$3>=1000 &&\$3<=2000 && \$1==\"$name\"){print \$1,\":\",\"$password\",\":\",\$3,\":\",\$4,\":\",\$5,\":\",\$6,\":\",\$7}}" /etc/passwd>>usersFile)
done
