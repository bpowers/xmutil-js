// Copyright 2020 Bobby Powers. All rights reserved.
// Use of this source code is governed by the MIT License
// that can be found in the LICENSE file.

import createModule from './xmutil';

export async function convertMdlToXmile(mdlSource: string | Readonly<Uint8Array>, pretty = true): Promise<string> {
  const xmutil = await createModule();
  return xmutil.ccall(
    '_convert_mdl_to_xmile',
    'string',
    ['string', 'number', 'boolean'],
    [mdlSource, mdlSource.length, !pretty],
  );
}
