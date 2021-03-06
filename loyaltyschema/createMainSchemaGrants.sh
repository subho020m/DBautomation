PROCESS_SCHEMA_NAME=$MAIN_SCHEMA;
sqlplus $SYS_USER/$SYS_PASS@$CONNECT_STRING as sysdba <<EOF >> $CRPSCRIPTS_DIR/logs/mainschemaGrants.log
grant execute on dbms_lock to $PROCESS_SCHEMA_NAME;
grant all on dbms_utility to $PROCESS_SCHEMA_NAME;
grant all on DBMS_PIPE to $PROCESS_SCHEMA_NAME;
grant all on dbms_system to $PROCESS_SCHEMA_NAME;
GRANT SELECT ON V_\$INSTANCE TO $PROCESS_SCHEMA_NAME;
GRANT SELECT ON GV_\$SESSION TO $PROCESS_SCHEMA_NAME;
GRANT ALTER SYSTEM TO $PROCESS_SCHEMA_NAME;
grant dba to $PROCESS_SCHEMA_NAME;
EOF
