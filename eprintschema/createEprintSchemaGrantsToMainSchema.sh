#Applying grants to MainSchema
sed "s/<<OWNER>>/$EPRINT_SCHEMA/" $CRPSCRIPTS_DIR/eprintschema/grantsToMainSchema.sh > $CRPSCRIPTS_DIR/tmp/tmpGrantScript1.sh
sed "s/<<TARGET>>/$MAIN_SCHEMA/" $CRPSCRIPTS_DIR/tmp/tmpGrantScript1.sh > $CRPSCRIPTS_DIR/tmp/tmpGrantScript.sh
chmod 755 $CRPSCRIPTS_DIR/tmp/tmpGrantScript.sh
$CRPSCRIPTS_DIR/tmp/tmpGrantScript.sh $EPRINT_SCHEMA/$EPRINT_SCHEMA_PASS@$CONNECT_STRING
rm $CRPSCRIPTS_DIR/tmp/tmpGrantScript1.sh
rm $CRPSCRIPTS_DIR/tmp/tmpGrantScript.sh