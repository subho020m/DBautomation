#Applying grants to MainSchema
sed "s/<<OWNER>>/$FFA_SCHEMA/" $CRPSCRIPTS_DIR/ffaschema/grantsToMainSchema.sh > $CRPSCRIPTS_DIR/tmp/tmpGrantScript1.sh
sed "s/<<TARGET>>/$MAIN_SCHEMA/" $CRPSCRIPTS_DIR/tmp/tmpGrantScript1.sh > $CRPSCRIPTS_DIR/tmp/tmpGrantScript.sh
chmod 755 $CRPSCRIPTS_DIR/tmp/tmpGrantScript.sh
$CRPSCRIPTS_DIR/tmp/tmpGrantScript.sh $FFA_SCHEMA/$FFA_SCHEMA_PASS@$CONNECT_STRING
rm $CRPSCRIPTS_DIR/tmp/tmpGrantScript1.sh
rm $CRPSCRIPTS_DIR/tmp/tmpGrantScript.sh