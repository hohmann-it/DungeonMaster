package com.hohmannit.dungeonmaster.shared.spellbook;

import org.eclipse.scout.rt.platform.service.IService;
import org.eclipse.scout.rt.shared.TunnelToServer;
import org.eclipse.scout.rt.shared.services.common.jdbc.SearchFilter;

@TunnelToServer
public interface ISpellbookService extends IService {
	SpellbookTablePageData getSpellbookTableData(SearchFilter filter);
}
