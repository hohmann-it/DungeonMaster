package com.hohmannit.dungeonmaster.server.datenbank.zauber.zauberbuch;

import org.eclipse.scout.rt.platform.exception.VetoException;
import org.eclipse.scout.rt.platform.holders.NVPair;
import org.eclipse.scout.rt.platform.text.TEXTS;
import org.eclipse.scout.rt.security.ACCESS;
import org.eclipse.scout.rt.server.jdbc.SQL;
import org.eclipse.scout.rt.shared.services.common.jdbc.SearchFilter;

import com.hohmannit.dungeonmaster.shared.datenbank.zauber.zauberbuch.CreateZauberbuchPermission;
import com.hohmannit.dungeonmaster.shared.datenbank.zauber.zauberbuch.IZauberbuchService;
import com.hohmannit.dungeonmaster.shared.datenbank.zauber.zauberbuch.ReadZauberbuchPermission;
import com.hohmannit.dungeonmaster.shared.datenbank.zauber.zauberbuch.UpdateZauberbuchPermission;
import com.hohmannit.dungeonmaster.shared.spellbook.ZauberbuchTablePageData;
import com.hohmannit.dungeonmaster.shared.zauberbuch.ZauberFormData;

public class ZauberbuchService implements IZauberbuchService {
	@Override
	public ZauberbuchTablePageData getZauberbuchTableData(SearchFilter filter) {
		ZauberbuchTablePageData pageData = new ZauberbuchTablePageData();

		String sql = ZauberbuchSQLs.ZAUBER_PAGE_SELECT + ZauberbuchSQLs.ZAUBER_PAGE_DATA_SELECT_INTO;
		SQL.selectInto(sql, new NVPair("page", pageData));

		return pageData;
	}

	@Override
	public ZauberFormData prepareCreate(ZauberFormData formData) {
		if (!ACCESS.check(new CreateZauberbuchPermission())) {
			throw new VetoException(TEXTS.get("Allgemein_ZugriffVerweigert"));
		}
		return formData;
	}

	@Override
	public ZauberFormData create(ZauberFormData formData) {
		if (!ACCESS.check(new CreateZauberbuchPermission())) {
			throw new VetoException(TEXTS.get("Allgemein_ZugriffVerweigert"));
		}
		SQL.insert(ZauberbuchSQLs.ZAUBER_INSERT, formData);
		return formData;
	}

	@Override
	public ZauberFormData load(ZauberFormData formData) {
		if (!ACCESS.check(new ReadZauberbuchPermission())) {
			throw new VetoException(TEXTS.get("Allgemein_ZugriffVerweigert"));
		}
		SQL.select(ZauberbuchSQLs.ZAUBER_SELECT, formData);
		loadZaubermaterial(formData);

		return formData;
	}

	@Override
	public ZauberFormData store(ZauberFormData formData) {
		if (!ACCESS.check(new UpdateZauberbuchPermission())) {
			throw new VetoException(TEXTS.get("Allgemein_ZugriffVerweigert"));
		}
		return formData;
	}

	@Override
	public ZauberFormData loadZaubermaterial(ZauberFormData formData) {
		SQL.select(ZauberbuchSQLs.ZAUBERMATERIAL_SELECT, formData);
		return formData;
	}
}
