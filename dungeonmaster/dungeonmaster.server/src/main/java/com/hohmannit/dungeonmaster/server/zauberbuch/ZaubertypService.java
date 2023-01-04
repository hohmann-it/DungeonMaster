package com.hohmannit.dungeonmaster.server.zauberbuch;

import java.util.List;

import org.eclipse.scout.rt.platform.exception.VetoException;
import org.eclipse.scout.rt.platform.holders.NVPair;
import org.eclipse.scout.rt.platform.text.TEXTS;
import org.eclipse.scout.rt.security.ACCESS;
import org.eclipse.scout.rt.server.jdbc.SQL;
import org.eclipse.scout.rt.shared.services.common.jdbc.SearchFilter;

import com.hohmannit.dungeonmaster.server.sql.SQLs;
import com.hohmannit.dungeonmaster.shared.zauberbuch.CreateZaubertypPermission;
import com.hohmannit.dungeonmaster.shared.zauberbuch.IZaubertypService;
import com.hohmannit.dungeonmaster.shared.zauberbuch.ReadZaubertypPermission;
import com.hohmannit.dungeonmaster.shared.zauberbuch.UpdateZaubertypPermission;
import com.hohmannit.dungeonmaster.shared.zauberbuch.ZaubertypFormData;
import com.hohmannit.dungeonmaster.shared.zauberbuch.ZaubertypTablePageData;

public class ZaubertypService implements IZaubertypService {
	@Override
	public ZaubertypTablePageData getZaubertypTableData(SearchFilter filter) {
		ZaubertypTablePageData pageData = new ZaubertypTablePageData();

		String sql = SQLs.ZAUBERTYP_PAGE_SELECT + SQLs.ZAUBERTYP_PAGE_SELECT_INTO;
		SQL.selectInto(sql, new NVPair("page", pageData));

		return pageData;
	}

	@Override
	public ZaubertypFormData prepareCreate(ZaubertypFormData formData) {
		if (!ACCESS.check(new CreateZaubertypPermission())) {
			throw new VetoException(TEXTS.get("AuthorizationFailed"));
		}
		return formData;
	}

	@Override
	public ZaubertypFormData create(ZaubertypFormData formData) {
		if (!ACCESS.check(new CreateZaubertypPermission())) {
			throw new VetoException(TEXTS.get("AuthorizationFailed"));
		}
		SQL.insert(SQLs.ZAUBERTYP_INSERT, formData);
		return formData;
	}

	@Override
	public ZaubertypFormData load(ZaubertypFormData formData) {
		if (!ACCESS.check(new ReadZaubertypPermission())) {
			throw new VetoException(TEXTS.get("AuthorizationFailed"));
		}
		SQL.select(SQLs.ZAUBERTYP_SELECT, formData);
		return formData;
	}

	@Override
	public ZaubertypFormData store(ZaubertypFormData formData) {
		if (!ACCESS.check(new UpdateZaubertypPermission())) {
			throw new VetoException(TEXTS.get("AuthorizationFailed"));
		}
		SQL.update(SQLs.ZAUBERTYP_UPDATE, formData);
		return formData;
	}

	@Override
	public void delete(List<Long> keys) {
		for (Long key : keys) {
			ZaubertypFormData formData = new ZaubertypFormData();
			formData.setZaubertypId(key);
			SQL.delete(SQLs.ZAUBERTYP_DELETE, formData);
		}
	}
}
