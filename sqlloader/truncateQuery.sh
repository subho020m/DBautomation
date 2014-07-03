sqlplus $1 <<EOF > ${HOME}/misc/automation/differences/truncatePayerWallet.log
delete from PAYER_WALLETS_BAK;
EOF

sqlplus $1 <<EOF > ${HOME}/misc/automation/differences/truncateWalletSpendLimit.log
delete from WALLET_SPEND_LIMITS_INDB;
EOF
