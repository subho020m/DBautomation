#!/bin/bash

#$1 referes to the option grant or synonym.
#$2 referes to the schema name where the script has to be run.
#$3 referes to the grant statement.
#$4 referes to the schema directory.
#$5 1 for prepend AUD_ and 0 for not.

createFile()
{
if [ "$1" = "grants" ]
 then
 dos2unix $fileLocation/grants.csv

 local grantVar="GRANT $3 ON " 

 while read myline
   do
    local tempLine="${grantVar}${myline} TO $2 ;"
    echo ${tempLine}
   done < $fileLocation/grants.csv  >  $fileLocation/grants.sql
fi

if [ "$1" = "synonyms" ]
 then
 dos2unix $fileLocation/synonyms.csv

 local grantVar="CREATE OR REPLACE SYNONYM "

 if [ "$4" = "1" ]
 then
 while read myline
   do
    local tempVar=$myline
    tempVar1=`echo $myline | cut -d , -f 1`
    tempVar2=`echo $myline | cut -d , -f 2`
    local tempLine=""

    if [ "$tempVar1" = "$tempVar2" ]
    then
    tempLine="${grantVar} AUD_${tempVar1} FOR ${2}.${tempVar1} ;"
    else
    tempLine="${grantVar} AUD_${tempVar1} FOR ${2}.${tempVar2} ;"
    fi    
    echo ${tempLine}
   done < $fileLocation/synonyms.csv   > $fileLocation/synonyms.sql
 fi

 if [ "$4" = "0" ]
 then
 while read myline
   do
    local tempLine="${grantVar} ${myline} FOR ${2}.${myline} ;"
    echo ${tempLine}
   done < $fileLocation/synonyms.csv   > $fileLocation/synonyms.sql
 fi

fi
}


fileLocation=$4

if [ "$1" = "grants" ]
then
createFile $1 $2 $3 $5
fi

if [ "$1" = "synonyms" ]
then
createFile $1 $2 $3 $5
fi
