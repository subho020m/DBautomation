#Applying grants to MainSchema
sed "s/<<OWNER>>/$LOYALTY_SCHEMA/" $CRPSCRIPTS_DIR/loyaltyschema/grantsToMainSchema.sh > $CRPSCRIPTS_DIR/tmp/tmpGrantScript1.sh
sed "s/<<TARGET>>/$MAIN_SCHEMA/" $CRPSCRIPTS_DIR/tmp/tmpGrantScript1.sh > $CRPSCRIPTS_DIR/tmp/tmpGrantScript.sh
chmod 755 $CRPSCRIPTS_DIR/tmp/tmpGrantScript.sh
$CRPSCRIPTS_DIR/tmp/tmpGrantScript.sh $LOYALTY_SCHEMA/$LOYALTY_SCHEMA_PASS@$CONNECT_STRING
rm $CRPSCRIPTS_DIR/tmp/tmpGrantScript1.sh
rm $CRPSCRIPTS_DIR/tmp/tmpGrantScript.sh