#!/bin/sh
## Description: Install Oracle Java and set is as default java interpreter.

## HOW TO USE (as root):
# curl -jkL https://raw.githubusercontent.com/saaadel/scripts/master/linux/install/oracle-database.sh | sh /dev/stdin
## OR
# bundle=Enterprise_Edition_12c sh -c 'curl -jkL https://raw.githubusercontent.com/saaadel/scripts/master/linux/install/oracle-database.sh | sh /dev/stdin'

# Database 12c
Enterprise_Edition_12c_Release_1of2=https://edelivery.oracle.com/akam/otn/linux/oracle12c/121020/linuxamd64_12102_database_1of2.zip
Enterprise_Edition_12c_Release_2of2=https://edelivery.oracle.com/akam/otn/linux/oracle12c/121020/linuxamd64_12102_database_2of2.zip


[ -z "$bundle" ] && bundle=Enterprise_Edition_12c
[ -z "$bundle1_url" ] && bundle1_url=$(eval echo "\$${bundle}_Release_1of2")
[ -z "$bundle2_url" ] && bundle2_url=$(eval echo "\$${bundle}_Release_2of2")

rm -rf /tmp/curl.tmp
curl -jkLo /tmp/curl.tmp -H "Cookie: oraclelicense=accept-database_111060_linx8664-cookie; OHS-edelivery.oracle.com-443=2A1418E7B23D34F28CCD775F9A3D40ED459B42D5D358D81EBC9A91395FB9587BD328E972B61EB5905A29C63693BFB92F34F369682804D3E5A35091A6EA3882C6A32FA506D7B2C8BB9224E931DDDDE4A3E456E7D70124568E378D7722FA9C1919F20D38D29D12284625B83B6111413EB682075BF2442D783EC6F6CADA380F4BE089312701B47BACA77845610749E9A944990061299C292845E9AD115C4F52821250D9DA3812CC48C6FE71C6225A7E52230C3A641618905E9D9AB9F538BC33E1EF174730E02084DAB060BF6ADF2EA24CC8E5DFCA03277F29EDD003CE989B07B443D851848B437650B3AA9E0A360CE5F6BA7058C3A35BD7F366~" "${bundle1_url}"

unzip -oqq /tmp/curl.tmp -d /opt && \
rm -rf /tmp/curl.tmp

rm -rf /tmp/curl.tmp
curl -jkLo /tmp/curl.tmp -H "Cookie: oraclelicense=accept-database_111060_linx8664-cookie; OHS-edelivery.oracle.com-443=2A1418E7B23D34F28CCD775F9A3D40ED459B42D5D358D81EBC9A91395FB9587BD328E972B61EB5905A29C63693BFB92F34F369682804D3E5A35091A6EA3882C6A32FA506D7B2C8BB9224E931DDDDE4A3E456E7D70124568E378D7722FA9C1919F20D38D29D12284625B83B6111413EB682075BF2442D783EC6F6CADA380F4BE089312701B47BACA77845610749E9A944990061299C292845E9AD115C4F52821250D9DA3812CC48C6FE71C6225A7E52230C3A641618905E9D9AB9F538BC33E1EF174730E02084DAB060BF6ADF2EA24CC8E5DFCA03277F29EDD003CE989B07B443D851848B437650B3AA9E0A360CE5F6BA7058C3A35BD7F366~" "${bundle2_url}"

## zip with one directory only inside
dirname=`zipinfo -1 /tmp/curl.tmp | awk -F/ '{print $1}' | uniq | tail -1 | sed 's:/*::'`

unzip -oqq /tmp/curl.tmp -d /opt && \
rm -rf /tmp/curl.tmp

echo /opt/$dirname/
