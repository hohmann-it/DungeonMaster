package com.hohmannit.dungeonmaster.shared.character;

import org.eclipse.scout.rt.platform.service.IService;
import org.eclipse.scout.rt.shared.TunnelToServer;
import org.eclipse.scout.rt.shared.services.common.jdbc.SearchFilter;

@TunnelToServer
public interface ICharakterService extends IService {
	CharakterTablePageData getCharakterTableData(SearchFilter filter);
}