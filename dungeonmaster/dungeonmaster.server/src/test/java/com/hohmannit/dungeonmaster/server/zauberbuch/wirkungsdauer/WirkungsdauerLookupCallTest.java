package com.hohmannit.dungeonmaster.server.zauberbuch.wirkungsdauer;

import java.util.List;

import org.eclipse.scout.rt.shared.services.lookup.ILookupRow;
import org.eclipse.scout.rt.testing.platform.runner.RunWithSubject;
import org.eclipse.scout.rt.testing.server.runner.RunWithServerSession;
import org.eclipse.scout.rt.testing.server.runner.ServerTestRunner;
import org.junit.Test;
import org.junit.runner.RunWith;

import com.hohmannit.dungeonmaster.server.ServerSession;
import com.hohmannit.dungeonmaster.shared.zauberbuch.wirkungsdauer.WirkungsdauerLookupCall;

@RunWithSubject("anonymous")
@RunWith(ServerTestRunner.class)
@RunWithServerSession(ServerSession.class)
public class WirkungsdauerLookupCallTest {
	// TODO [phohm] add test cases

	protected WirkungsdauerLookupCall createLookupCall() {
		return new WirkungsdauerLookupCall();
	}

	@Test
	public void testGetDataByAll() {
		WirkungsdauerLookupCall call = createLookupCall();
		// TODO [phohm] fill call
		List<? extends ILookupRow<Long>> data = call.getDataByAll();
		// TODO [phohm] verify data
	}

	@Test
	public void testGetDataByKey() {
		WirkungsdauerLookupCall call = createLookupCall();
		// TODO [phohm] fill call
		List<? extends ILookupRow<Long>> data = call.getDataByKey();
		// TODO [phohm] verify data
	}

	@Test
	public void testGetDataByText() {
		WirkungsdauerLookupCall call = createLookupCall();
		// TODO [phohm] fill call
		List<? extends ILookupRow<Long>> data = call.getDataByText();
		// TODO [phohm] verify data
	}
}
