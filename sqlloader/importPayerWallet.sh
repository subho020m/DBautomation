
#cd $HOME/sqlloader/
for f in exDBPayerWallet_*;
do
        echo "import $f"
	sqlldr parfile = config.par control = payer_wallets_bak.ctl log = ${HOME}/misc/crpscripts/logs/payerWallets.log  data = $f bad = payerWallets.bad  discard = payerWallets.dis
done

for f in exDBSpendCtrl*;
do
      echo "import $f" 
	sqlldr parfile = config.par control = PayerSpendCtrl.ctl log = ${HOME}/misc/crpscripts/logs/PayerSpendCtrl.log  data = $f bad = PayerSpendCtrl.bad  discard = PayerSpendCtrl.dis
done

