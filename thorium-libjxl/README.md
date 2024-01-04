# Thorium libJXL

<img src="https://raw.githubusercontent.com/Alex313031/Thorium/main/logos/NEW/thorium.svg" width="64">&nbsp;&nbsp;&nbsp;<img src="https://raw.githubusercontent.com/Alex313031/thorium-libjxl/main/plus-sign.svg" width="64">&nbsp;&nbsp;&nbsp;<img src="https://raw.githubusercontent.com/Alex313031/thorium-libjxl/main/JPEG_XL_logo.svg" width="54">

 - [libjxl](https://github.com/libjxl/libjxl) for Thorium Browser: Restores [JPEG-XL](https://jpegxl.info/) functionality to Thorium/Chromium versions [post M109](https://chromium-review.googlesource.com/c/chromium/src/+/4081749).

 - This repo is added as a submodule to [the main Thorium repo](https://github.com/Alex313031/Thorium), and `setup.sh` therein copies this repos __//src/__ dir over the
 Chromium tree, and then Thorium's __//src/__ dir.

 &#62; @mo271's patch which this is based on: https://chromium-review.googlesource.com/c/chromium/src/+/4255409 \
 &#62; @gz83's patch which restores jxl devtools functionality: https://chromium-review.googlesource.com/c/devtools/devtools-frontend/+/4257582 \
 &#62; Also related, and needed for building is [libhighway](https://github.com/google/highway)

 &ndash; Both libjxl and libhighway versions are bumped to ~ Jun. 2023 revisions. \
 &ndash; For info on versions of these and other things, see the [VERSION.md](https://github.com/Alex313031/thorium-libjxl/blob/main/VERSION.md) file \
 &ndash; Note that PGO might be slightly less effective unless you generate your own *.profdata* file from a debug build of Thorium/Chromium.

 &ndash; __*NOTE:*__ the __//external/__ dir contains two files. These are modified by Thorium and so are excluded from the __//src/__ directory. If you want to integrate libjxl back into a [vanilla Chromium build](https://www.chromium.org), see below.

## Building

#### Thorium Build

 - Simply follow the [normal building procedures](https://github.com/Alex313031/thorium/blob/main/docs/BUILDING.md).

#### Chromium Build

 1. Checkout the Chromium version specified in the [VERSION.md](https://github.com/Alex313031/thorium-libjxl/blob/main/VERSION.md) file.

```bash
# In chromium/src dir #

git checkout -f tags/blahblah # replacing blahblah with the actual tag, i.e. 114.0.5735.134
git clean -ffd # cleans stale or removed dirs
gclient sync --with_branch_heads --with_tags -f -R -D # dont just use 'gclient sync'
```

 2. Run the `./setup.sh` script from within the repo. It assumes the Chromium repo is in *$HOME*, but can be overridden with the __CR_DIR__ env variable.
 3. [Build as normal](https://www.chromium.org/developers/how-tos/get-the-code/)

__NOTE:__ You could also use the *.patch* files with "git am" or "git apply --reject".
