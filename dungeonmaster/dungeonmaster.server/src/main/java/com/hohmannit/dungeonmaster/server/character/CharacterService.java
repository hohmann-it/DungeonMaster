package com.hohmannit.dungeonmaster.server.character;

import org.eclipse.scout.rt.platform.holders.NVPair;
import org.eclipse.scout.rt.server.jdbc.SQL;
import org.eclipse.scout.rt.shared.services.common.jdbc.SearchFilter;

import com.hohmannit.dungeonmaster.server.sql.SQLs;
import com.hohmannit.dungeonmaster.shared.character.CharacterTablePageData;
import com.hohmannit.dungeonmaster.shared.character.ICharacterService;

public class CharacterService implements ICharacterService {
	@Override
	public CharacterTablePageData getCharacterTableData(SearchFilter filter) {
		CharacterTablePageData pageData = new CharacterTablePageData();

		String sql = SQLs.CHARACTERS_PAGE_SELECT + SQLs.CHARACTERS_PAGE_DATA_SELECT_INTO;
		SQL.selectInto(sql, new NVPair("page", pageData));

		return pageData;
	}
}
