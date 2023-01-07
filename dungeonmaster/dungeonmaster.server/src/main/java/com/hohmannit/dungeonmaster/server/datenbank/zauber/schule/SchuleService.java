package com.hohmannit.dungeonmaster.server.datenbank.zauber.schule;

import java.util.List;

import org.eclipse.scout.rt.platform.exception.VetoException;
import org.eclipse.scout.rt.platform.holders.NVPair;
import org.eclipse.scout.rt.platform.text.TEXTS;
import org.eclipse.scout.rt.security.ACCESS;
import org.eclipse.scout.rt.server.jdbc.SQL;
import org.eclipse.scout.rt.shared.services.common.jdbc.SearchFilter;

import com.hohmannit.dungeonmaster.shared.datenbank.zauber.schule.CreateSchulePermission;
import com.hohmannit.dungeonmaster.shared.datenbank.zauber.schule.ISchuleService;
import com.hohmannit.dungeonmaster.shared.datenbank.zauber.schule.ReadSchulePermission;
import com.hohmannit.dungeonmaster.shared.datenbank.zauber.schule.UpdateSchulePermission;
import com.hohmannit.dungeonmaster.shared.zauberbuch.SchuleFormData;
import com.hohmannit.dungeonmaster.shared.zauberbuch.SchuleTablePageData;

public class SchuleService implements ISchuleService {
	@Override
	public SchuleTablePageData getSchuleTableData(SearchFilter filter) {
		SchuleTablePageData pageData = new SchuleTablePageData();

		String sql = SchuleSQLs.SCHULE_PAGE_SELECT + SchuleSQLs.SCHULE_PAGE_SELECT_INTO;
		SQL.selectInto(sql, new NVPair("page", pageData));

		return pageData;
	}

	@Override
	public SchuleFormData prepareCreate(SchuleFormData formData) {
		if (!ACCESS.check(new CreateSchulePermission())) {
			throw new VetoException(TEXTS.get("Allgemein_ZugriffVerweigert"));
		}
		return formData;
	}

	@Override
	public SchuleFormData create(SchuleFormData formData) {
		if (!ACCESS.check(new CreateSchulePermission())) {
			throw new VetoException(TEXTS.get("Allgemein_ZugriffVerweigert"));
		}
		SQL.insert(SchuleSQLs.SCHULE_INSERT, formData);
		return formData;
	}

	@Override
	public SchuleFormData load(SchuleFormData formData) {
		if (!ACCESS.check(new ReadSchulePermission())) {
			throw new VetoException(TEXTS.get("Allgemein_ZugriffVerweigert"));
		}
		SQL.select(SchuleSQLs.SCHULE_SELECT, formData);
		return formData;
	}

	@Override
	public SchuleFormData store(SchuleFormData formData) {
		if (!ACCESS.check(new UpdateSchulePermission())) {
			throw new VetoException(TEXTS.get("Allgemein_ZugriffVerweigert"));
		}
		SQL.update(SchuleSQLs.SCHULE_UPDATE, formData);
		return formData;
	}

	@Override
	public void delete(List<Long> list) {
		for (Long key : list) {
			SchuleFormData formData = new SchuleFormData();
			formData.setId(key);
			SQL.delete(SchuleSQLs.SCHULE_DELETE, formData);
		}
	}
}
