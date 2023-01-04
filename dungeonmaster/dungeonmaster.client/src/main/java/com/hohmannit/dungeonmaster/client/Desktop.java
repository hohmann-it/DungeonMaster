package com.hohmannit.dungeonmaster.client;

import java.util.List;
import java.util.Set;

import org.eclipse.scout.rt.client.ui.action.keystroke.IKeyStroke;
import org.eclipse.scout.rt.client.ui.action.menu.AbstractMenu;
import org.eclipse.scout.rt.client.ui.action.menu.IMenuType;
import org.eclipse.scout.rt.client.ui.desktop.AbstractDesktop;
import org.eclipse.scout.rt.client.ui.desktop.notification.NativeNotificationDefaults;
import org.eclipse.scout.rt.client.ui.desktop.outline.AbstractOutlineViewButton;
import org.eclipse.scout.rt.client.ui.desktop.outline.IOutline;
import org.eclipse.scout.rt.client.ui.form.AbstractFormMenu;
import org.eclipse.scout.rt.platform.Order;
import org.eclipse.scout.rt.platform.classid.ClassId;
import org.eclipse.scout.rt.platform.text.TEXTS;
import org.eclipse.scout.rt.platform.util.CollectionUtility;

import com.hohmannit.dungeonmaster.client.database.DatenbankOutline;
import com.hohmannit.dungeonmaster.client.search.SucheOutline;
import com.hohmannit.dungeonmaster.client.zauberbuch.ZauberForm;
import com.hohmannit.dungeonmaster.shared.Icons;

/**
 * @author phohm
 */
public class Desktop extends AbstractDesktop {

	public Desktop() {
	}

	@Override
	protected boolean getConfiguredDense() {
		return true;
	}

	@Override
	protected String getConfiguredTitle() {
		return TEXTS.get("Allgemein_ApplicationTitle");
	}

	@Override
	protected String getConfiguredLogoId() {
		return Icons.AppLogo;
	}

	@Override
	protected NativeNotificationDefaults getConfiguredNativeNotificationDefaults() {
		return super.getConfiguredNativeNotificationDefaults().withIconId("application_logo.png");
	}

	@Override
	protected List<Class<? extends IOutline>> getConfiguredOutlines() {
		return CollectionUtility.<Class<? extends IOutline>>arrayList(DatenbankOutline.class, SucheOutline.class);
	}

	@Override
	protected void execDefaultView() {
		selectFirstVisibleOutline();
	}

	protected void selectFirstVisibleOutline() {
		for (IOutline outline : getAvailableOutlines()) {
			if (outline.isEnabled() && outline.isVisible()) {
				setOutline(outline.getClass());
				return;
			}
		}
	}

	@Order(1000)
	public class DatenbankOutlineViewButton extends AbstractOutlineViewButton {

		public DatenbankOutlineViewButton() {
			this(DatenbankOutline.class);
		}

		protected DatenbankOutlineViewButton(Class<? extends DatenbankOutline> outlineClass) {
			super(Desktop.this, outlineClass);
		}

		@Override
		protected String getConfiguredKeyStroke() {
			return IKeyStroke.F2;
		}

	}

	@Order(2000)
	public class SucheOutlineViewButton extends AbstractOutlineViewButton {

		public SucheOutlineViewButton() {
			this(SucheOutline.class);
		}

		protected SucheOutlineViewButton(Class<? extends SucheOutline> outlineClass) {
			super(Desktop.this, outlineClass);
		}

		@Override
		protected DisplayStyle getConfiguredDisplayStyle() {
			return DisplayStyle.TAB;
		}

		@Override
		protected String getConfiguredKeyStroke() {
			return IKeyStroke.F3;
		}
	}

	@Order(1000)
	public class SchnellzugriffMenu extends AbstractMenu {
		@Override
		protected String getConfiguredText() {
			return TEXTS.get("QuickAccess");
		}

		@Override
		protected String getConfiguredIconId() {
			return Icons.Star;
		}

		@Order(10)
		@ClassId("effb3b69-f488-4aed-8923-d430a5f1fd97")
		public class NewZauberMenu extends AbstractMenu {

			@Override
			protected String getConfiguredText() {
				return TEXTS.get("NeuerZauber");
			}

			@Override
			protected void execAction() {
				new ZauberForm().startNew();
			}
		}
	}

	@Order(2000)
	public class OptionenMenu extends AbstractFormMenu<OptionsForm> {
		@Override
		protected String getConfiguredText() {
			return TEXTS.get("Optionen");
		}

		@Override
		protected String getConfiguredIconId() {
			return Icons.Gear;
		}

		// end::DesktopInit[]
		// end::OptionsMenu[]
		@Override
		protected String getConfiguredKeyStroke() {
			return IKeyStroke.F10;
		}
		// tag::OptionsMenu[]

		// tag::DesktopInit[]
		@Override
		protected Class<OptionsForm> getConfiguredForm() {
			return OptionsForm.class;
		}
	}

	@Order(3000)
	public class BenutzerMenu extends AbstractMenu {
		@Override
		protected String getConfiguredText() {
			return TEXTS.get("UserMenu");
		}

		@Override
		protected Set<? extends IMenuType> getConfiguredMenuTypes() {
			return CollectionUtility.hashSet();
		}

		@Override
		protected String getConfiguredIconId() {
			return Icons.PersonSolid;
		}

		@Override
		protected void execAction() {
		}
	}
}
