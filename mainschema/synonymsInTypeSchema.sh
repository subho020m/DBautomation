sqlplus $1 <<EOF >> $CRPSCRIPTS_DIR/logs/mainschemaUserSynonyms.log
DECLARE
    l_owner_v     VARCHAR2(32):= '<<OWNER>>';
    l_to_user_v   VARCHAR2(32):= '<<TARGET>>';
BEGIN
    FOR REC IN (SELECT 'CREATE OR REPLACE SYNONYM '|| l_to_user_v || '.' || OBJECT_NAME || ' FOR '||l_owner_v || '.' || OBJECT_NAME L_COMMAND 
                FROM ALL_OBJECTS 
                WHERE OWNER=UPPER(l_owner_v) 
                AND OBJECT_NAME IN ('PARTITION_MASTER','PARTITION_DETAILS','GNL_ERROR_LOG_PRC','GNL_CREATE_DEL_PARTITION_PRC'))
    LOOP
        BEGIN
		EXECUTE IMMEDIATE REC.L_COMMAND;
        EXCEPTION
		WHEN OTHERS THEN
			NULL;
        END;
    END LOOP;
END;
/
EOF
