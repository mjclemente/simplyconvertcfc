# SimplyConvertCFC
A CFML wrapper for the [SimplyConvert API](https://simplyconvertapiv2.docs.apiary.io/).
A wrapper for the SimplyConvert API for building integrations with their legal tech platform

This is an early stage API wrapper and does not yet cover the full SimplyConvert API. *Feel free to use the issue tracker to report bugs or suggest improvements!*

### Acknowledgements

This project borrows heavily from the API frameworks built by [jcberquist](https://github.com/jcberquist). Thanks to John for all the inspiration!

## Table of Contents

- [Quick Start](#quick-start)
- [Authentication](#authentication)
- [Setup](#setup)
- [`SimplyConvertCFC` Reference Manual](#reference-manual)
- [Reference Manual for `helpers.simplyCase`](#reference-manual-for-helperssimplycase)

### Quick Start
The following is a minimal example of doing something helpful.

The following is a quick example of listing the cases in your account.

```cfc
simplyconvert = new path.to.simplyconvertcfc.simplyconvert( apiKey = 'xxx' );

cases = simplyconvert.listCases();

writeDump( var='#cases.data#' );
```

### Authentication

To get started with the SimplyConvert API, you'll need an [API Key](https://simplyconvertapiv2.docs.apiary.io/#reference/authentication) which you can copy from the dashboard's Integration Settings page.

Once you have this, you can provide it to this wrapper manually when creating the component, as in the Quick Start example above, or via an environment variable named `SIMPLYCONVERT_API_KEY`, which will get picked up automatically. This latter approach is generally preferable, as it keeps hardcoded credentials out of your codebase.

### Reference Manual

A full reference manual for all public methods in `simplyconvert.cfc`  can be found in the `docs` directory, [here](https://github.com/mjclemente/simplyconvertcfc/blob/main/docs/simplyconvert.md).

### Reference Manual for `helpers.simplyCase`

The reference manual for all public methods in `helpers/simplyCase.cfc` can be found in the `docs` directory, [in `simplyCase.md`](https://github.com/mjclemente/simplyconvertcfc/blob/main/docs/simplyCase.md).

---
