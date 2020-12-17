#!/usr/bin/env node

const fs = require('fs');

const xmutil = require('./xmutil');

xmutil.onRuntimeInitialized = () => {
    const args = process.argv.slice(2);

    const f = fs.readFileSync(args[0], 'utf-8');

    const result = xmutil.ccall('_convert_mdl_to_xmile',
        'string',
        ['string', 'number', 'boolean'],
        [f, f.length, false],
    );

    console.log(result);
}

