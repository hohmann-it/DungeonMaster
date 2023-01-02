package com.hohmannit.dungeonmaster.client;

import java.util.Locale;

import org.eclipse.scout.rt.client.AbstractClientSession;
import org.eclipse.scout.rt.client.IClientSession;
import org.eclipse.scout.rt.client.session.ClientSessionProvider;
import org.eclipse.scout.rt.client.ui.ClientUIPreferences;
import org.eclipse.scout.rt.shared.services.common.code.CODES;

/**
 * @author phohm
 */
public class ClientSession extends AbstractClientSession {

	public static final String PREF_USER_LOCALE = "PREF_USER_LOCALE";

	public ClientSession() {
		super(true);
	}

	/**
	 * @return The {@link IClientSession} which is associated with the current
	 *         thread, or {@code null} if not found.
	 */
	public static ClientSession get() {
		return ClientSessionProvider.currentSession(ClientSession.class);
	}

	@Override
	protected void execLoadSession() {
		// pre-load all known code types
		CODES.getAllCodeTypes("com.hohmannit.dungeonmaster.shared");

		// The locale needs to be set before the Desktop is created.
		String localeString = ClientUIPreferences.getClientPreferences(get()).get(PREF_USER_LOCALE, null);
		if (localeString != null) {
			setLocale(Locale.forLanguageTag(localeString));
		}

		setDesktop(new Desktop());
	}
}
