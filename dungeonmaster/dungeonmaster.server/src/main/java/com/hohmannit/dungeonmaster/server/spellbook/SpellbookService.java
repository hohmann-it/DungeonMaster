package com.hohmannit.dungeonmaster.server.spellbook;

import org.eclipse.scout.rt.shared.services.common.jdbc.SearchFilter;

import com.hohmannit.dungeonmaster.shared.spellbook.ISpellbookService;
import com.hohmannit.dungeonmaster.shared.spellbook.SpellbookTablePageData;

public class SpellbookService implements ISpellbookService {
	@Override
	public SpellbookTablePageData getSpellbookTableData(SearchFilter filter) {
		SpellbookTablePageData pageData = new SpellbookTablePageData();

		return pageData;
	}
}
