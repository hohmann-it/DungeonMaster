package com.hohmannit.dungeonmaster.shared.datenbank.charaktere;

import org.eclipse.scout.rt.platform.service.IService;
import org.eclipse.scout.rt.shared.TunnelToServer;
import org.eclipse.scout.rt.shared.services.common.jdbc.SearchFilter;

import com.hohmannit.dungeonmaster.shared.character.CharakterTablePageData;

@TunnelToServer
public interface ICharaktereService extends IService {
	CharakterTablePageData getCharakterTableData(SearchFilter filter);
}
