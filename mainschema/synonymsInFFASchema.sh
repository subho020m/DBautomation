sqlplus $1 <<EOF >> $CRPSCRIPTS_DIR/logs/mainschemaUserSynonyms.log
DECLARE
    l_owner_v     VARCHAR2(32):= '<<OWNER>>';
    l_to_user_v   VARCHAR2(32):= '<<TARGET>>';
BEGIN
    FOR REC IN (SELECT 'CREATE OR REPLACE SYNONYM '|| l_to_user_v || '.' || OBJECT_NAME || ' FOR '||l_owner_v || '.' || OBJECT_NAME L_COMMAND 
                FROM ALL_OBJECTS 
                WHERE OWNER=UPPER(l_owner_v) 
                AND OBJECT_NAME IN ('CB_SERVICES','CB_SUB_SERVICES','CB_POS_SERVICES','CB_SERV_ORDER_STATUS','FXL_LOCATION_ZONES_VIEW','SMS_MESSAGE_QUEUE','WF_CALENDAR','WF_SHIFT','WF_SPECIALDAY','FFA_LINESMAN_DETAILS','SEQ_SMS_MESSAGE_QUEUE','VALIDATE_USER_SESSION','ABILLITY_INTERFACE_API'))
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