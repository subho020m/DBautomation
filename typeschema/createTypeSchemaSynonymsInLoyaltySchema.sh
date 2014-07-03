#Creating Synonyms in LoyaltySchema
sed "s/<<OWNER>>/$TYPE_SCHEMA/" $CRPSCRIPTS_DIR/typeschema/synonymsInLoyaltySchema.sh > $CRPSCRIPTS_DIR/tmp/tmpSynonymScript1.sh
sed "s/<<TARGET>>/$LOYALTY_SCHEMA/" $CRPSCRIPTS_DIR/tmp/tmpSynonymScript1.sh > $CRPSCRIPTS_DIR/tmp/tmpSynonymScript.sh
chmod 755 $CRPSCRIPTS_DIR/tmp/tmpSynonymScript.sh
$CRPSCRIPTS_DIR/tmp/tmpSynonymScript.sh $TYPE_SCHEMA/$TYPE_SCHEMA_PASS@$CONNECT_STRING
rm $CRPSCRIPTS_DIR/tmp/tmpSynonymScript1.sh
rm $CRPSCRIPTS_DIR/tmp/tmpSynonymScript.sh