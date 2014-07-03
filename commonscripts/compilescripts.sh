sed "s/<<SCHEMA_NAME>>/$PROCESS_SCHEMA_NAME/" $CRPSCRIPTS_DIR/commonscripts/compilescripts.sql > $CRPSCRIPTS_DIR/tmp/tmpcompilescripts.sql
sqlplus $PROCESS_SCHEMA_NAME/$PROCESS_SCHEMA_PASS@$CONNECT_STRING <<EOF >> $CRPSCRIPTS_DIR/logs/commonscriptsCompileobjects.log
set define off
@$CRPSCRIPTS_DIR/tmp/tmpcompilescripts.sql
EOF
rm $CRPSCRIPTS_DIR/tmp/tmpcompilescripts.sql