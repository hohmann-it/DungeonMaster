package com.hohmannit.dungeonmaster.server.datenbank.charaktere;

import org.eclipse.scout.rt.platform.holders.NVPair;
import org.eclipse.scout.rt.server.jdbc.SQL;
import org.eclipse.scout.rt.shared.services.common.jdbc.SearchFilter;

import com.hohmannit.dungeonmaster.shared.character.CharakterTablePageData;
import com.hohmannit.dungeonmaster.shared.datenbank.charaktere.ICharaktereService;

public class CharakterService implements ICharaktereService {
	@Override
	public CharakterTablePageData getCharakterTableData(SearchFilter filter) {
		CharakterTablePageData pageData = new CharakterTablePageData();

		String sql = CharaktereSQLs.CHARAKTERE_PAGE_SELECT + CharaktereSQLs.CHARAKTERE_PAGE_DATA_SELECT_INTO;
		SQL.selectInto(sql, new NVPair("page", pageData));

		return pageData;
	}
}
