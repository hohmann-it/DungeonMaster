package com.hohmannit.dungeonmaster.shared.text;

import org.eclipse.scout.rt.platform.Order;
import org.eclipse.scout.rt.platform.text.AbstractDynamicNlsTextProviderService;

/**
 * @author phohm
 */
@Order(-2000)
public class DefaultTextProviderService extends AbstractDynamicNlsTextProviderService {
	@Override
	public String getDynamicNlsBaseName() {
		return "com.hohmannit.dungeonmaster.shared.texts.Texts";
	}
}
