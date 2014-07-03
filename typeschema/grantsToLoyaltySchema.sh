sqlplus $1 <<EOF >> $CRPSCRIPTS_DIR/logs/typeschemaUserGrants.log
DECLARE
    l_owner_v     VARCHAR2(32):= '<<OWNER>>';
    l_to_user_v   VARCHAR2(32):= '<<TARGET>>';
BEGIN
    FOR REC IN (SELECT 'GRANT EXECUTE ON '|| OBJECT_NAME || ' TO '||l_to_user_v L_COMMAND 
                FROM ALL_OBJECTS 
                WHERE OWNER=UPPER(l_owner_v) 
                AND OBJECT_NAME IN ('TL_ADJUSTMENT','TI_POST_ADJUSTMENT','T_GSM_SERVICE_DETAILS','T_ABILLITY_OUTPUT','T_ADJUSTMENT'))
    LOOP            
        EXECUTE IMMEDIATE REC.L_COMMAND;
    END LOOP;
END;
/
EOF
