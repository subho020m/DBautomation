if [ "$CREATE_TABLESPACES" = "1" ]
then

if [ "$RELATIONSHIP" = "Integration"  ]
then
sqlplus $SYS_USER/$SYS_PASS@$CONNECT_STRING as sysdba <<EOF >> $CRPSCRIPTS_DIR/logs/commonscriptsTableSpaces.log
drop tablespace $MAIN_SCHEMA_TABLESPACE including contents and datafiles;
create tablespace $MAIN_SCHEMA_TABLESPACE;
EOF
fi

fi
