#Creating Synonyms in MainSchema
sed "s/<<OWNER>>/$EPRINT_SCHEMA/" $CRPSCRIPTS_DIR/eprintschema/synonymsInMainSchema.sh > $CRPSCRIPTS_DIR/tmp/tmpSynonymScript1.sh
sed "s/<<TARGET>>/$MAIN_SCHEMA/" $CRPSCRIPTS_DIR/tmp/tmpSynonymScript1.sh > $CRPSCRIPTS_DIR/tmp/tmpSynonymScript.sh
chmod 755 $CRPSCRIPTS_DIR/tmp/tmpSynonymScript.sh
$CRPSCRIPTS_DIR/tmp/tmpSynonymScript.sh $EPRINT_SCHEMA/$EPRINT_SCHEMA_PASS@$CONNECT_STRING
rm $CRPSCRIPTS_DIR/tmp/tmpSynonymScript1.sh
rm $CRPSCRIPTS_DIR/tmp/tmpSynonymScript.sh