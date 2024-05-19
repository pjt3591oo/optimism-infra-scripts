mkdir ~/optimism/op-node/sequencer
cd ~/optimism/op-node/sequencer

../bin/op-node \
  --l1=$L1_RPC_URL \
  --l1.rpckind=$L1_RPC_KIND \
  --l2=http://localhost:8551 \
  --l2.jwt-secret=../jwt.txt \
  --sequencer.enabled \
  --sequencer.l1-confs=5 \
  --verifier.l1-confs=4 \
  --rpc.addr=0.0.0.0 \
  --rpc.port=8547 \
  --rpc.enable-admin \
  --p2p.no-discovery \
  --p2p.sequencer.key=$GS_SEQUENCER_PRIVATE_KEY \
  --p2p.listen.ip=0.0.0.0 \
  --p2p.listen.tcp=9222 \
  --p2p.listen.udp=9222 \
  --metrics.enabled=true \
  --metrics.addr=0.0.0.0 \
  --metrics.port=7300 \
  --rollup.config=../rollup.json

  