mkdir ~/optimism/op-node/r0
cd ~/optimism/op-node/r0

../bin/op-node \
  --l1=$L1_RPC_URL \
  --l1.rpckind=$L1_RPC_KIND \
  --l2=http://localhost:9551 \
  --l2.jwt-secret=./jwt.txt \
  --rpc.addr=0.0.0.0 \
  --rpc.port=9547 \
  --rpc.enable-admin \
  --p2p.no-discovery \
  --p2p.listen.ip=0.0.0.0 \
  --p2p.listen.tcp=10222 \
  --p2p.listen.udp=10222 \
  --p2p.static=/ip4/127.0.0.1/tcp/9222/p2p/16Uiu2HAkz3jHzvpxKdNEN1ntMYKThYdKJX7XRNrLez9Ypk7UkFrF \
  --metrics.addr=0.0.0.0 \
  --metrics.enabled=true \
  --metrics.port=8300 \
  --rollup.config=../rollup.json

curl -X POST -H "Content-Type: application/json" --data \
    '{"jsonrpc":"2.0","method":"opp2p_self","params":[],"id":1}'  \
    http://localhost:8547 | jq

curl -X POST -H "Content-Type: application/json" --data \
    '{"jsonrpc":"2.0","method":"opp2p_self","params":[],"id":1}'  \
    http://localhost:9547 | jq

curl -X POST -H "Content-Type: application/json" --data \
    '{"jsonrpc":"2.0","method":"opp2p_disconnectPeer","params":["/ip4/127.0.0.1/tcp/9222/p2p/16Uiu2HAkz3jHzvpxKdNEN1ntMYKThYdKJX7XRNrLez9Ypk7UkFrF"],"id":1}'  \
    http://localhost:9547 

curl -X POST -H "Content-Type: application/json" --data \
    '{"jsonrpc":"2.0","method":"opp2p_peers","params":[true],"id":1}'  \
    http://localhost:8547 | jq