package com.hohmannit.dungeonmaster.server.datenbank.zauber.zeitaufwand;

import java.util.List;

import org.eclipse.scout.rt.platform.exception.PlatformException;
import org.eclipse.scout.rt.platform.exception.VetoException;
import org.eclipse.scout.rt.platform.holders.NVPair;
import org.eclipse.scout.rt.platform.text.TEXTS;
import org.eclipse.scout.rt.security.ACCESS;
import org.eclipse.scout.rt.server.jdbc.SQL;
import org.eclipse.scout.rt.shared.services.common.jdbc.SearchFilter;

import com.hohmannit.dungeonmaster.server.Exceptional;
import com.hohmannit.dungeonmaster.shared.datenbank.zauber.zeitaufwand.CreateZeitaufwandtypPermission;
import com.hohmannit.dungeonmaster.shared.datenbank.zauber.zeitaufwand.IZeitaufwandtypService;
import com.hohmannit.dungeonmaster.shared.datenbank.zauber.zeitaufwand.ReadZeitaufwandtypPermission;
import com.hohmannit.dungeonmaster.shared.datenbank.zauber.zeitaufwand.UpdateZeitaufwandtypPermission;
import com.hohmannit.dungeonmaster.shared.zauberbuch.ZeitaufwandtypFormData;
import com.hohmannit.dungeonmaster.shared.zauberbuch.ZeitaufwandtypTablePageData;

public class ZeitaufwandService implements IZeitaufwandtypService {
	@Override
	public ZeitaufwandtypTablePageData getZeitaufwandtypTableData(SearchFilter filter) {
		ZeitaufwandtypTablePageData pageData = new ZeitaufwandtypTablePageData();
		String sql = ZeitaufwandSQLs.ZEITAUFWANDTYP_PAGE_SELECT + ZeitaufwandSQLs.ZEITAUFWANDTYP_PAGE_SELECT_INTO;
		SQL.selectInto(sql, new NVPair("page", pageData));

		return pageData;
	}

	@Override
	public ZeitaufwandtypFormData prepareCreate(ZeitaufwandtypFormData formData) {
		if (!ACCESS.check(new CreateZeitaufwandtypPermission())) {
			throw new VetoException(TEXTS.get("Allgemein_ZugriffVerweigert"));
		}
		return formData;
	}

	@Override
	public ZeitaufwandtypFormData create(ZeitaufwandtypFormData formData) {
		if (!ACCESS.check(new CreateZeitaufwandtypPermission())) {
			throw new VetoException(TEXTS.get("Allgemein_ZugriffVerweigert"));
		}
		SQL.insert(ZeitaufwandSQLs.ZEITAUFWANDTYP_INSERT, formData);
		return formData;
	}

	@Override
	public ZeitaufwandtypFormData load(ZeitaufwandtypFormData formData) {
		if (!ACCESS.check(new ReadZeitaufwandtypPermission())) {
			throw new VetoException(TEXTS.get("Allgemein_ZugriffVerweigert"));
		}
		SQL.select(ZeitaufwandSQLs.ZEITAUFWANDTYP_SELECT, formData);
		return formData;
	}

	@Override
	public ZeitaufwandtypFormData store(ZeitaufwandtypFormData formData) {
		if (!ACCESS.check(new UpdateZeitaufwandtypPermission())) {
			throw new VetoException(TEXTS.get("Allgemein_ZugriffVerweigert"));
		}
		SQL.update(ZeitaufwandSQLs.ZEITAUFWANDTYP_UPDATE, formData);
		return formData;
	}

	@Override
	public void delete(List<Long> list) {
		for (Long key : list) {
			ZeitaufwandtypFormData formData = new ZeitaufwandtypFormData();
			formData.setZeitaufwandtypId(key);
			try {
				SQL.delete(ZeitaufwandSQLs.ZEITAUFWANDTYP_DELETE, formData);
			} catch (PlatformException e) {
				Exceptional.handle(e);
			}
		}
	}
}
