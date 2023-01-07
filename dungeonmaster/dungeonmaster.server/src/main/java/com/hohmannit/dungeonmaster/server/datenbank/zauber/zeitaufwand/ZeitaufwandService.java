package com.hohmannit.dungeonmaster.server.datenbank.zauber.zeitaufwand;

import java.util.List;

import org.eclipse.scout.rt.platform.exception.VetoException;
import org.eclipse.scout.rt.platform.holders.NVPair;
import org.eclipse.scout.rt.platform.text.TEXTS;
import org.eclipse.scout.rt.security.ACCESS;
import org.eclipse.scout.rt.server.jdbc.SQL;
import org.eclipse.scout.rt.shared.services.common.jdbc.SearchFilter;

import com.hohmannit.dungeonmaster.shared.datenbank.zauber.zeitaufwand.CreateZeitaufwandtypPermission;
import com.hohmannit.dungeonmaster.shared.datenbank.zauber.zeitaufwand.IZeitaufwandtypService;
import com.hohmannit.dungeonmaster.shared.datenbank.zauber.zeitaufwand.ReadZeitaufwandtypPermission;
import com.hohmannit.dungeonmaster.shared.datenbank.zauber.zeitaufwand.UpdateZeitaufwandtypPermission;
import com.hohmannit.dungeonmaster.shared.zauberbuch.ZeitaufwandFormData;
import com.hohmannit.dungeonmaster.shared.zauberbuch.ZeitaufwandTablePageData;

public class ZeitaufwandService implements IZeitaufwandtypService {
	@Override
	public ZeitaufwandTablePageData getZeitaufwandtypTableData(SearchFilter filter) {
		ZeitaufwandTablePageData pageData = new ZeitaufwandTablePageData();
		String sql = ZeitaufwandSQLs.ZEITAUFWAND_PAGE_SELECT + ZeitaufwandSQLs.ZEITAUFWAND_PAGE_SELECT_INTO;
		SQL.selectInto(sql, new NVPair("page", pageData));

		return pageData;
	}

	@Override
	public ZeitaufwandFormData prepareCreate(ZeitaufwandFormData formData) {
		if (!ACCESS.check(new CreateZeitaufwandtypPermission())) {
			throw new VetoException(TEXTS.get("Allgemein_ZugriffVerweigert"));
		}
		return formData;
	}

	@Override
	public ZeitaufwandFormData create(ZeitaufwandFormData formData) {
		if (!ACCESS.check(new CreateZeitaufwandtypPermission())) {
			throw new VetoException(TEXTS.get("Allgemein_ZugriffVerweigert"));
		}
		SQL.insert(ZeitaufwandSQLs.ZEITAUFWAND_INSERT, formData);
		return formData;
	}

	@Override
	public ZeitaufwandFormData load(ZeitaufwandFormData formData) {
		if (!ACCESS.check(new ReadZeitaufwandtypPermission())) {
			throw new VetoException(TEXTS.get("Allgemein_ZugriffVerweigert"));
		}
		SQL.select(ZeitaufwandSQLs.ZEITAUFWAND_SELECT, formData);
		return formData;
	}

	@Override
	public ZeitaufwandFormData store(ZeitaufwandFormData formData) {
		if (!ACCESS.check(new UpdateZeitaufwandtypPermission())) {
			throw new VetoException(TEXTS.get("Allgemein_ZugriffVerweigert"));
		}
		SQL.update(ZeitaufwandSQLs.ZEITAUFWAND_UPDATE, formData);
		return formData;
	}

	@Override
	public void delete(List<Long> list) {
		for (Long key : list) {
			ZeitaufwandFormData formData = new ZeitaufwandFormData();
			formData.setId(key);
			SQL.delete(ZeitaufwandSQLs.ZEITAUFWAND_DELETE, formData);
		}
	}
}
