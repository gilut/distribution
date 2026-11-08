# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2026-present ROCKNIX (https://github.com/ROCKNIX)

PKG_NAME="noto-sans-cjk"
PKG_VERSION="2.004"
PKG_LICENSE="OFL-1.1"
PKG_SITE="https://github.com/notofonts/noto-cjk"
if [ "${DEVICE}" = "RK3576" ]; then
  NOTO_CJK_DIR="Japanese"
  NOTO_CJK_FONT="NotoSansCJKjp-Regular.otf"
  PKG_SHA256="68a3fc98800b2a27b371f2fb79991daf3633bd89309d4ffaa6946fd587f375b5"
  PKG_LONGDESC="Noto Sans CJK Japanese font"
else
  NOTO_CJK_DIR="SimplifiedChinese"
  NOTO_CJK_FONT="NotoSansCJKsc-Regular.otf"
  PKG_SHA256="2c76254f6fc379fddfce0a7e84fb5385bb135d3e399294f6eeb6680d0365b74b"
  PKG_LONGDESC="Noto Sans CJK Simplified Chinese font"
fi
PKG_URL="https://raw.githubusercontent.com/notofonts/noto-cjk/Sans${PKG_VERSION}/Sans/OTF/${NOTO_CJK_DIR}/${NOTO_CJK_FONT}"
PKG_SOURCE_NAME="${NOTO_CJK_FONT%.otf}-${PKG_VERSION}.otf"
PKG_DEPENDS_TARGET="toolchain"
PKG_TOOLCHAIN="manual"

unpack() {
  mkdir -p ${PKG_BUILD}
  cp -f ${SOURCES}/${PKG_NAME}/${PKG_SOURCE_NAME} ${PKG_BUILD}/${NOTO_CJK_FONT}
}

makeinstall_target() {
  mkdir -p ${INSTALL}/usr/share/fonts/truetype/noto-cjk
  cp -f ${PKG_BUILD}/${NOTO_CJK_FONT} \
    ${INSTALL}/usr/share/fonts/truetype/noto-cjk/
}
