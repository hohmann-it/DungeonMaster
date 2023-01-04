package com.hohmannit.dungeonmaster.server.datenbank.zauber.zaubertyp;

import java.util.List;

import org.eclipse.scout.rt.platform.exception.PlatformException;
import org.eclipse.scout.rt.platform.exception.VetoException;
import org.eclipse.scout.rt.platform.holders.NVPair;
import org.eclipse.scout.rt.platform.text.TEXTS;
import org.eclipse.scout.rt.security.ACCESS;
import org.eclipse.scout.rt.server.jdbc.SQL;
import org.eclipse.scout.rt.shared.services.common.jdbc.SearchFilter;

import com.hohmannit.dungeonmaster.server.Exceptional;
import com.hohmannit.dungeonmaster.shared.datenbank.zauber.zaubertyp.CreateZaubertypPermission;
import com.hohmannit.dungeonmaster.shared.datenbank.zauber.zaubertyp.IZaubertypService;
import com.hohmannit.dungeonmaster.shared.datenbank.zauber.zaubertyp.ReadZaubertypPermission;
import com.hohmannit.dungeonmaster.shared.datenbank.zauber.zaubertyp.UpdateZaubertypPermission;
import com.hohmannit.dungeonmaster.shared.zauberbuch.ZaubertypFormData;
import com.hohmannit.dungeonmaster.shared.zauberbuch.ZaubertypTablePageData;

public class ZaubertypService implements IZaubertypService {
	@Override
	public ZaubertypTablePageData getZaubertypTableData(SearchFilter filter) {
		ZaubertypTablePageData pageData = new ZaubertypTablePageData();

		String sql = ZaubertypSQLs.ZAUBERTYP_PAGE_SELECT + ZaubertypSQLs.ZAUBERTYP_PAGE_SELECT_INTO;
		SQL.selectInto(sql, new NVPair("page", pageData));

		return pageData;
	}

	@Override
	public ZaubertypFormData prepareCreate(ZaubertypFormData formData) {
		if (!ACCESS.check(new CreateZaubertypPermission())) {
			throw new VetoException(TEXTS.get("Allgemein_ZugriffVerweigert"));
		}
		return formData;
	}

	@Override
	public ZaubertypFormData create(ZaubertypFormData formData) {
		if (!ACCESS.check(new CreateZaubertypPermission())) {
			throw new VetoException(TEXTS.get("Allgemein_ZugriffVerweigert"));
		}
		SQL.insert(ZaubertypSQLs.ZAUBERTYP_INSERT, formData);
		return formData;
	}

	@Override
	public ZaubertypFormData load(ZaubertypFormData formData) {
		if (!ACCESS.check(new ReadZaubertypPermission())) {
			throw new VetoException(TEXTS.get("Allgemein_ZugriffVerweigert"));
		}
		SQL.select(ZaubertypSQLs.ZAUBERTYP_SELECT, formData);
		return formData;
	}

	@Override
	public ZaubertypFormData store(ZaubertypFormData formData) {
		if (!ACCESS.check(new UpdateZaubertypPermission())) {
			throw new VetoException(TEXTS.get("Allgemein_ZugriffVerweigert"));
		}
		SQL.update(ZaubertypSQLs.ZAUBERTYP_UPDATE, formData);
		return formData;
	}

	@Override
	public void delete(List<Long> keys) {
		for (Long key : keys) {
			ZaubertypFormData formData = new ZaubertypFormData();
			formData.setZaubertypId(key);
			try {
				SQL.delete(ZaubertypSQLs.ZAUBERTYP_DELETE, formData);
			} catch (PlatformException e) {
				Exceptional.handle(e);
			}
		}
	}
}
