package com.hohmannit.dungeonmaster.server.zauberbuch;

import org.eclipse.scout.rt.platform.holders.NVPair;
import org.eclipse.scout.rt.server.jdbc.SQL;
import org.eclipse.scout.rt.shared.services.common.jdbc.SearchFilter;

import com.hohmannit.dungeonmaster.server.sql.SQLs;
import com.hohmannit.dungeonmaster.shared.spellbook.ZauberbuchTablePageData;
import com.hohmannit.dungeonmaster.shared.zauberbuch.IZauberbuchService;

public class ZauberbuchService implements IZauberbuchService {
	@Override
	public ZauberbuchTablePageData getZauberbuchTableData(SearchFilter filter) {
		ZauberbuchTablePageData pageData = new ZauberbuchTablePageData();

		String sql = SQLs.ZAUBER_PAGE_SELECT + SQLs.ZAUBER_PAGE_DATA_SELECT_INTO;
		SQL.selectInto(sql, new NVPair("page", pageData));

		return pageData;
	}
}
