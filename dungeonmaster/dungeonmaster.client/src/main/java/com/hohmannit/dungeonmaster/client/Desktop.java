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
import org.eclipse.scout.rt.platform.Order;
import org.eclipse.scout.rt.platform.text.TEXTS;
import org.eclipse.scout.rt.platform.util.CollectionUtility;

import com.hohmannit.dungeonmaster.client.database.DatabaseOutline;
import com.hohmannit.dungeonmaster.client.search.SearchOutline;
import com.hohmannit.dungeonmaster.shared.Icons;

/**
 * @author phohm
 */
public class Desktop extends AbstractDesktop {

	public Desktop() {
	}

	@Override
	protected String getConfiguredTitle() {
		return TEXTS.get("ApplicationTitle");
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
		return CollectionUtility.<Class<? extends IOutline>>arrayList(DatabaseOutline.class, SearchOutline.class);
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
	public class DatabaseOutlineViewButton extends AbstractOutlineViewButton {

		public DatabaseOutlineViewButton() {
			this(DatabaseOutline.class);
		}

		protected DatabaseOutlineViewButton(Class<? extends DatabaseOutline> outlineClass) {
			super(Desktop.this, outlineClass);
		}

		@Override
		protected String getConfiguredKeyStroke() {
			return IKeyStroke.F2;
		}
	}

	@Order(1000)
	public class QuickAccessMenu extends AbstractMenu {
		@Override
		protected String getConfiguredText() {
			return TEXTS.get("QuickAccess");
		}

		@Override
		protected Set<? extends IMenuType> getConfiguredMenuTypes() {
			return CollectionUtility.hashSet();
		}

		@Override
		protected void execAction() {
		}
	}

	@Order(2000)
	public class OptionsMenu extends AbstractMenu {
		@Override
		protected String getConfiguredText() {
			return TEXTS.get("Options");
		}

		@Override
		protected Set<? extends IMenuType> getConfiguredMenuTypes() {
			return CollectionUtility.hashSet();
		}

		@Override
		protected String getConfiguredIconId() {
			return Icons.Gear;
		}

		@Override
		protected void execAction() {
		}
	}

	@Order(3000)
	public class UserMenu extends AbstractMenu {
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

	@Order(2000)
	public class SearchOutlineViewButton extends AbstractOutlineViewButton {

		public SearchOutlineViewButton() {
			this(SearchOutline.class);
		}

		protected SearchOutlineViewButton(Class<? extends SearchOutline> outlineClass) {
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
}
