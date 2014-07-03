sqlplus $1 <<EOF >> $CRPSCRIPTS_DIR/logs/ffaschemaUserGrants.log
DECLARE
    l_owner_v     VARCHAR2(32):= '<<OWNER>>';
    l_to_user_v   VARCHAR2(32):= '<<TARGET>>';
BEGIN
    FOR REC IN(SELECT 'GRANT EXECUTE ON '|| OBJECT_NAME || ' TO '||l_to_user_v L_COMMAND
               FROM ALL_OBJECTS 
               WHERE OWNER=UPPER(l_owner_v) 
               AND OBJECT_NAME IN('FFA_COMPLETE_TASK'))
    LOOP
        EXECUTE IMMEDIATE REC.L_COMMAND;
    END LOOP;
END;
/
EOF
