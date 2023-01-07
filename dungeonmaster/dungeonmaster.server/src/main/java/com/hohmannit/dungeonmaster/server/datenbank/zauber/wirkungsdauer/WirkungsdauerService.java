package com.hohmannit.dungeonmaster.server.datenbank.zauber.wirkungsdauer;

import java.util.List;

import org.eclipse.scout.rt.platform.exception.VetoException;
import org.eclipse.scout.rt.platform.holders.NVPair;
import org.eclipse.scout.rt.platform.text.TEXTS;
import org.eclipse.scout.rt.security.ACCESS;
import org.eclipse.scout.rt.server.jdbc.SQL;
import org.eclipse.scout.rt.shared.services.common.jdbc.SearchFilter;

import com.hohmannit.dungeonmaster.shared.datenbank.zauber.wirkungsdauer.CreateWirkungsdauerPermission;
import com.hohmannit.dungeonmaster.shared.datenbank.zauber.wirkungsdauer.IWirkungsdauerService;
import com.hohmannit.dungeonmaster.shared.datenbank.zauber.wirkungsdauer.ReadWirkungsdauerPermission;
import com.hohmannit.dungeonmaster.shared.datenbank.zauber.wirkungsdauer.UpdateWirkungsdauerPermission;
import com.hohmannit.dungeonmaster.shared.datenbank.zauber.wirkungsdauer.WirkungsdauerFormData;
import com.hohmannit.dungeonmaster.shared.datenbank.zauber.wirkungsdauer.WirkungsdauerTablePageData;

public class WirkungsdauerService implements IWirkungsdauerService {
	@Override
	public WirkungsdauerTablePageData getWirkungsdauerTableData(SearchFilter filter) {
		WirkungsdauerTablePageData pageData = new WirkungsdauerTablePageData();

		String sql = WirkungsdauerSQLs.WIRKUNGSDAUER_PAGE_SELECT + WirkungsdauerSQLs.WIRKUNGSDAUER_PAGE_SELECT_INTO;
		SQL.selectInto(sql, new NVPair("page", pageData));
		return pageData;
	}

	@Override
	public WirkungsdauerFormData prepareCreate(WirkungsdauerFormData formData) {
		if (!ACCESS.check(new CreateWirkungsdauerPermission())) {
			throw new VetoException(TEXTS.get("AuthorizationFailed"));
		}
		return formData;
	}

	@Override
	public WirkungsdauerFormData create(WirkungsdauerFormData formData) {
		if (!ACCESS.check(new CreateWirkungsdauerPermission())) {
			throw new VetoException(TEXTS.get("AuthorizationFailed"));
		}
		SQL.insert(WirkungsdauerSQLs.WIRKUNGSDAUER_INSERT, formData);
		return formData;
	}

	@Override
	public WirkungsdauerFormData load(WirkungsdauerFormData formData) {
		if (!ACCESS.check(new ReadWirkungsdauerPermission())) {
			throw new VetoException(TEXTS.get("AuthorizationFailed"));
		}
		SQL.select(WirkungsdauerSQLs.WIRKUNGSDAUER_SELECT, formData);
		return formData;
	}

	@Override
	public WirkungsdauerFormData store(WirkungsdauerFormData formData) {
		if (!ACCESS.check(new UpdateWirkungsdauerPermission())) {
			throw new VetoException(TEXTS.get("AuthorizationFailed"));
		}
		SQL.update(WirkungsdauerSQLs.WIRKUNGSDAUER_UPDATE, formData);
		return formData;
	}

	@Override
	public void delete(List<Long> list) {
		for (Long key : list) {
			WirkungsdauerFormData formData = new WirkungsdauerFormData();
			formData.setId(key);
			SQL.delete(WirkungsdauerSQLs.WIRKUNGSDAUER_DELETE, formData);
		}
	}
}
