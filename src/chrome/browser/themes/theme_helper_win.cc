// Copyright 2023 The Chromium Authors and Alex313031
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#include "chrome/browser/themes/theme_helper_win.h"

#include "chrome/browser/win/titlebar_config.h"
#include "chrome/grit/theme_resources.h"
#include "skia/ext/skia_utils_win.h"
#include "ui/base/win/shell.h"

bool ThemeHelperWin::ShouldUseNativeFrame(
    const CustomThemeSupplier* theme_supplier) const {
  const bool use_native_frame_if_enabled =
      ShouldCustomDrawSystemTitlebar() ||
      !HasCustomImage(IDR_THEME_FRAME, theme_supplier);
  return use_native_frame_if_enabled && ui::win::IsAeroGlassEnabled() && !base::CommandLine::ForCurrentProcess()->HasSwitch("disable-aero");
}
