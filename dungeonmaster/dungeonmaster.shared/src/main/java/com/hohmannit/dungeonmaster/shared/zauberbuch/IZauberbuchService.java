package com.hohmannit.dungeonmaster.shared.zauberbuch;

import org.eclipse.scout.rt.platform.service.IService;
import org.eclipse.scout.rt.shared.TunnelToServer;
import org.eclipse.scout.rt.shared.services.common.jdbc.SearchFilter;

import com.hohmannit.dungeonmaster.shared.spellbook.ZauberbuchTablePageData;

@TunnelToServer
public interface IZauberbuchService extends IService {
	ZauberbuchTablePageData getZauberbuchTableData(SearchFilter filter);
}
