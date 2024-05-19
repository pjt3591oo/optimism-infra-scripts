cd ~/optimism/packages/contracts-bedrock

# L1에 컨트랙트 배포 (deployments 생성)
forge script scripts/Deploy.s.sol:Deploy --private-key $GS_ADMIN_PRIVATE_KEY --broadcast --rpc-url $L1_RPC_URL --slow

# deploy-config 생성
./scripts/getting-started/config.sh

# rollup.json, genesis.json 생성
cd ~/optimism/op-node
go run cmd/main.go genesis l2 \
  --deploy-config ../packages/contracts-bedrock/deploy-config/getting-started.json \
  --l1-deployments ../packages/contracts-bedrock/deployments/getting-started/.deploy \
  --outfile.l2 genesis.json \
  --outfile.rollup rollup.json \
  --l1-rpc $L1_RPC_URL

# op-node, op-geth 통신을 위한 JWT 생성
openssl rand -hex 32 > jwt.txt

# 생성된 파일들을 op-geth로 복사
cp genesis.json ~/op-geth
cp jwt.txt ~/op-geth