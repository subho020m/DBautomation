#Creating Synonyms in TypeSchema
sed "s/<<OWNER>>/$MAIN_SCHEMA/" $CRPSCRIPTS_DIR/mainschema/synonymsInTypeSchema.sh > $CRPSCRIPTS_DIR/tmp/tmpSynonymScript1.sh
sed "s/<<TARGET>>/$TYPE_SCHEMA/" $CRPSCRIPTS_DIR/tmp/tmpSynonymScript1.sh > $CRPSCRIPTS_DIR/tmp/tmpSynonymScript.sh
chmod 755 $CRPSCRIPTS_DIR/tmp/tmpSynonymScript.sh
$CRPSCRIPTS_DIR/tmp/tmpSynonymScript.sh $MAIN_SCHEMA/$MAIN_SCHEMA_PASS@$CONNECT_STRING
rm $CRPSCRIPTS_DIR/tmp/tmpSynonymScript1.sh
rm $CRPSCRIPTS_DIR/tmp/tmpSynonymScript.sh