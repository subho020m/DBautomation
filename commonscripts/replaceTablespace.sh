
sed "s/<<PRODTABLESPACE>>/ $PROD_TABLESPACE/" $1 > a.txt
sed "s/<<CDR_TABLESPACE>>/ $MAIN_SCHEMA_CDR_TABLESPACE/" a.txt > b.txt
sed "s/<<HISTTABLESPACE>>/ $HIST_TABLESPACE/" b.txt > c.txt
sed "s/<<CDR_BLOCKTABLESPACE>>/ $CDR_BLOCKTABLESPACE/" c.txt >d.txt
sed "s/<<CDR_KEYTABLESPACE>>/ $CDR_KEYTABLESPACE/" d.txt > e.txt

mv e.txt $1
rm a.txt
rm b.txt
rm c.txt
rm d.txt
