#!/usr/bin/env node

const fs = require('fs');
const xmutil = require('./lib-node/index');

const args = process.argv.slice(2);
const f = fs.readFileSync(args[0], 'utf-8');

(async function() {
  let xmile = await xmutil.convertMdlToXmile(f.toString(), false);
  console.log(xmile);
}());
