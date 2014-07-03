sqlplus $1 <<EOF >> $CRPSCRIPTS_DIR/logs/loyaltyschemaUserGrants.log
DECLARE
    l_owner_v     VARCHAR2(32):= '<<OWNER>>';
    l_to_user_v   VARCHAR2(32):= '<<TARGET>>';
BEGIN
    FOR REC IN (SELECT 'GRANT SELECT,INSERT,UPDATE,DELETE ON '|| OBJECT_NAME || ' TO '||l_to_user_v L_COMMAND 
                FROM ALL_OBJECTS 
                WHERE OWNER=UPPER(l_owner_v) 
                AND OBJECT_NAME IN ('LYT_SUBSCRIBER_ENROL_BUF','LYT_COS_REQUEST'))
    LOOP            
        EXECUTE IMMEDIATE REC.L_COMMAND;
    END LOOP;
END;
/
EOF
