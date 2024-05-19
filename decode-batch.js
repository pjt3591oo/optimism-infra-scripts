const { decodeBatcherTransactionCalldata } = require('@blocktorch/optimism-batch-decoder')
const fs = require('fs');
async function main() {
    const calldata = fs.readFileSync('test.txt', 'utf8');
    console.log(calldata)
    // const calldata = ``;
    const batcherTransaction = await decodeBatcherTransactionCalldata(calldata);

    console.log(batcherTransaction)
    // console.log(batcherTransaction.frames[0])
    // console.log(batcherTransaction.frames[0].batches)

}

main();