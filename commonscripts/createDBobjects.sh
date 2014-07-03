createObjects()
{
sqlplus $PROCESS_SCHEMA_NAME/$PROCESS_SCHEMA_PASS@$CONNECT_STRING <<EOF >> $CRPSCRIPTS_DIR/logs/commonscriptsSchemaobjects.log
 set define off
  @$PROCESS_SCHEMA_DIR/TypeScript/tempTypes.sql
  @$PROCESS_SCHEMA_DIR/TableScript/tempTables.sql
  @$PROCESS_SCHEMA_DIR/Sequences/sequences.sql
  @$CRPSCRIPTS_DIR/list.sql
  @$CRPSCRIPTS_DIR/masterdata.sql
  @$CRPSCRIPTS_DIR/tmp/tempForeignkeys.sql
  @$CRPSCRIPTS_DIR/additionalmasterdata.sql
 commit;
EOF
}


checkRUN_DBMS_JOBS()
{
if [ "$RUN_DBMS_JOBS" = "1" ]
     then
sqlplus $PROCESS_SCHEMA_NAME/$PROCESS_SCHEMA_PASS@$CONNECT_STRING <<EOF >> $CRPSCRIPTS_DIR/logs/commonscriptsSchemaobjects.log
      @$PROCESS_SCHEMA_DIR/Jobs/jobs.sql
      COMMIT;
EOF
fi

if [ "$MAX_DATED_PARTITIONS" = "1" ]
     then
sqlplus $PROCESS_SCHEMA_NAME/$PROCESS_SCHEMA_PASS@$CONNECT_STRING <<EOF >> $CRPSCRIPTS_DIR/logs/commonscriptsSchemaobjects.log
      @$PROCESS_SCHEMA_DIR/TableScript/partitions.sql
EOF
fi
}

createObjects
checkRUN_DBMS_JOBS


if [ -e $CRPSCRIPTS_DIR/referencedata.sql ]
   then
rm $CRPSCRIPTS_DIR/referencedata.sql
fi

if [ -e $CRPSCRIPTS_DIR/masterdata.sql ]
   then
rm $CRPSCRIPTS_DIR/masterdata.sql
fi

if [ -e $CRPSCRIPTS_DIR/additionalmasterdata.sql ]
   then
rm $CRPSCRIPTS_DIR/additionalmasterdata.sql
fi

if [ -e $CRPSCRIPTS_DIR/list.sql ]
   then
rm $CRPSCRIPTS_DIR/list.sql
fi

if [ -e $PROCESS_SCHEMA_DIR/TableScript/tempTables.sql ]
   then
rm $PROCESS_SCHEMA_DIR/TableScript/tempTables.sql
fi

if [ -e $CRPSCRIPTS_DIR/tmp/tempForeignkeys.sql ]
   then
rm $CRPSCRIPTS_DIR/tmp/tempForeignkeys.sql
fi

if [ -e $PROCESS_SCHEMA_DIR/Triggers/tempTriggers.sql ]
   then
rm $PROCESS_SCHEMA_DIR/Triggers/tempTriggers.sql
fi

if [ -e $PROCESS_SCHEMA_DIR/TypeScript/tempTypes.sql ]
   then
rm $PROCESS_SCHEMA_DIR/TypeScript/tempTypes.sql
fi