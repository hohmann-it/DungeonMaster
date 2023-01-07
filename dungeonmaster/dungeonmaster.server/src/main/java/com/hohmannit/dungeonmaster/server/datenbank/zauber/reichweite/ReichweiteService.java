package com.hohmannit.dungeonmaster.server.datenbank.zauber.reichweite;

import java.util.List;

import org.eclipse.scout.rt.platform.exception.VetoException;
import org.eclipse.scout.rt.platform.holders.NVPair;
import org.eclipse.scout.rt.platform.text.TEXTS;
import org.eclipse.scout.rt.security.ACCESS;
import org.eclipse.scout.rt.server.jdbc.SQL;
import org.eclipse.scout.rt.shared.services.common.jdbc.SearchFilter;

import com.hohmannit.dungeonmaster.shared.datenbank.zauber.reichweite.CreateReichweitePermission;
import com.hohmannit.dungeonmaster.shared.datenbank.zauber.reichweite.IReichweiteService;
import com.hohmannit.dungeonmaster.shared.datenbank.zauber.reichweite.ReadReichweitePermission;
import com.hohmannit.dungeonmaster.shared.datenbank.zauber.reichweite.ReichweiteFormData;
import com.hohmannit.dungeonmaster.shared.datenbank.zauber.reichweite.ReichweiteTablePageData;
import com.hohmannit.dungeonmaster.shared.datenbank.zauber.reichweite.UpdateReichweitePermission;

public class ReichweiteService implements IReichweiteService {
	@Override
	public ReichweiteTablePageData getReichweiteTableData(SearchFilter filter) {
		ReichweiteTablePageData pageData = new ReichweiteTablePageData();
		String sql = ReichweiteSQLs.REICHWEITE_PAGE_SELECT + ReichweiteSQLs.REICHWEITE_PAGE_SELECT_INTO;
		SQL.selectInto(sql, new NVPair("page", pageData));
		return pageData;
	}

	@Override
	public ReichweiteFormData prepareCreate(ReichweiteFormData formData) {
		if (!ACCESS.check(new CreateReichweitePermission())) {
			throw new VetoException(TEXTS.get("AuthorizationFailed"));
		}
		return formData;
	}

	@Override
	public ReichweiteFormData create(ReichweiteFormData formData) {
		if (!ACCESS.check(new CreateReichweitePermission())) {
			throw new VetoException(TEXTS.get("AuthorizationFailed"));
		}
		SQL.insert(ReichweiteSQLs.REICHWEITE_INSERT, formData);
		return formData;
	}

	@Override
	public ReichweiteFormData load(ReichweiteFormData formData) {
		if (!ACCESS.check(new ReadReichweitePermission())) {
			throw new VetoException(TEXTS.get("AuthorizationFailed"));
		}
		SQL.select(ReichweiteSQLs.REICHWEITE_SELECT, formData);
		return formData;
	}

	@Override
	public ReichweiteFormData store(ReichweiteFormData formData) {
		if (!ACCESS.check(new UpdateReichweitePermission())) {
			throw new VetoException(TEXTS.get("AuthorizationFailed"));
		}
		SQL.update(ReichweiteSQLs.REICHWEITE_UPDATE, formData);
		return formData;
	}

	@Override
	public void delete(List<Long> list) {
		for (Long key : list) {
			ReichweiteFormData formData = new ReichweiteFormData();
			formData.setId(key);
			SQL.delete(ReichweiteSQLs.REICHWEITE_DELETE, formData);
		}
	}
}
