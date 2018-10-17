package com.fighttiger.fighter.common.tools.configurer;

import java.io.File;

public interface ConfigChangeListener {
    void onChange(File file, String key, String value);
}
