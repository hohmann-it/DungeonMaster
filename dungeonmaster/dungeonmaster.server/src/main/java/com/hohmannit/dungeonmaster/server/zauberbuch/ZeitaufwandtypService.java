package com.hohmannit.dungeonmaster.server.zauberbuch;

import java.util.List;

import org.eclipse.scout.rt.platform.exception.PlatformException;
import org.eclipse.scout.rt.platform.exception.VetoException;
import org.eclipse.scout.rt.platform.holders.NVPair;
import org.eclipse.scout.rt.platform.text.TEXTS;
import org.eclipse.scout.rt.security.ACCESS;
import org.eclipse.scout.rt.server.jdbc.SQL;
import org.eclipse.scout.rt.shared.services.common.jdbc.SearchFilter;

import com.hohmannit.dungeonmaster.server.Exceptional;
import com.hohmannit.dungeonmaster.server.sql.SQLs;
import com.hohmannit.dungeonmaster.shared.zauberbuch.CreateZeitaufwandtypPermission;
import com.hohmannit.dungeonmaster.shared.zauberbuch.IZeitaufwandtypService;
import com.hohmannit.dungeonmaster.shared.zauberbuch.ReadZeitaufwandtypPermission;
import com.hohmannit.dungeonmaster.shared.zauberbuch.UpdateZeitaufwandtypPermission;
import com.hohmannit.dungeonmaster.shared.zauberbuch.ZeitaufwandtypFormData;
import com.hohmannit.dungeonmaster.shared.zauberbuch.ZeitaufwandtypTablePageData;

public class ZeitaufwandtypService implements IZeitaufwandtypService {
	@Override
	public ZeitaufwandtypTablePageData getZeitaufwandtypTableData(SearchFilter filter) {
		ZeitaufwandtypTablePageData pageData = new ZeitaufwandtypTablePageData();
		String sql = SQLs.ZEITAUFWANDTYP_PAGE_SELECT + SQLs.ZEITAUFWANDTYP_PAGE_SELECT_INTO;
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
		SQL.insert(SQLs.ZEITAUFWANDTYP_INSERT, formData);
		return formData;
	}

	@Override
	public ZeitaufwandtypFormData load(ZeitaufwandtypFormData formData) {
		if (!ACCESS.check(new ReadZeitaufwandtypPermission())) {
			throw new VetoException(TEXTS.get("Allgemein_ZugriffVerweigert"));
		}
		SQL.select(SQLs.ZEITAUFWANDTYP_SELECT, formData);
		return formData;
	}

	@Override
	public ZeitaufwandtypFormData store(ZeitaufwandtypFormData formData) {
		if (!ACCESS.check(new UpdateZeitaufwandtypPermission())) {
			throw new VetoException(TEXTS.get("Allgemein_ZugriffVerweigert"));
		}
		SQL.update(SQLs.ZEITAUFWANDTYP_UPDATE, formData);
		return formData;
	}

	@Override
	public void delete(List<Long> list) {
		for (Long key : list) {
			ZeitaufwandtypFormData formData = new ZeitaufwandtypFormData();
			formData.setZeitaufwandtypId(key);
			try {
				SQL.delete(SQLs.ZEITAUFWANDTYP_DELETE, formData);
			} catch (PlatformException e) {
				Exceptional.handle(e);
			}
		}
	}
}
