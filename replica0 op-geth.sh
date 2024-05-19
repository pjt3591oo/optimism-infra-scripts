mkdir -p ~/op-geth/r0/datadir

cd ~/op-geth/r0
../build/bin/geth init --datadir=datadir ../genesis.json

../build/bin/geth \
    --datadir ./datadir \
    --rollup.sequencerhttp=http://localhost:8545/ \
    --http \
    --http.port=9545 \
    --http.corsdomain="*" \
    --http.vhosts="*" \
    --http.addr=0.0.0.0 \
    --http.api=web3,debug,eth,txpool,net,engine,admin \
    --ws \
    --ws.addr=0.0.0.0 \
    --ws.port=9546 \
    --ws.origins="*" \
    --ws.api=debug,eth,txpool,net,engine,admin \
    --syncmode=full \
    --gcmode=archive \
    --nodiscover \
    --maxpeers=5 \
    --networkid=42069 \
    --authrpc.vhosts="*" \
    --authrpc.addr=0.0.0.0 \
    --authrpc.port=9551 \
    --authrpc.jwtsecret=./jwt.txt \
    --verbosity=3 \
    --port=40303 \
    --rollup.disabletxpoolgossip=true