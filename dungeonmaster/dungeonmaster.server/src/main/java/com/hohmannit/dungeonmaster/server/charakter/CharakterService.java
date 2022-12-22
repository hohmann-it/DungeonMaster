package com.hohmannit.dungeonmaster.server.charakter;

import org.eclipse.scout.rt.platform.holders.NVPair;
import org.eclipse.scout.rt.server.jdbc.SQL;
import org.eclipse.scout.rt.shared.services.common.jdbc.SearchFilter;

import com.hohmannit.dungeonmaster.server.sql.SQLs;
import com.hohmannit.dungeonmaster.shared.character.CharakterTablePageData;
import com.hohmannit.dungeonmaster.shared.character.ICharakterService;

public class CharakterService implements ICharakterService {
	@Override
	public CharakterTablePageData getCharakterTableData(SearchFilter filter) {
		CharakterTablePageData pageData = new CharakterTablePageData();

		String sql = SQLs.CHARAKTERE_PAGE_SELECT + SQLs.CHARAKTERE_PAGE_DATA_SELECT_INTO;
		SQL.selectInto(sql, new NVPair("page", pageData));

		return pageData;
	}
}
