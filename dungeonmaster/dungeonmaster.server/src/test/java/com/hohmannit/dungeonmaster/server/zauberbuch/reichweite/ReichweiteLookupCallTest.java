package com.hohmannit.dungeonmaster.server.zauberbuch.reichweite;

import java.util.List;

import org.eclipse.scout.rt.shared.services.lookup.ILookupRow;
import org.eclipse.scout.rt.testing.platform.runner.RunWithSubject;
import org.eclipse.scout.rt.testing.server.runner.RunWithServerSession;
import org.eclipse.scout.rt.testing.server.runner.ServerTestRunner;
import org.junit.Test;
import org.junit.runner.RunWith;

import com.hohmannit.dungeonmaster.server.ServerSession;
import com.hohmannit.dungeonmaster.shared.datenbank.zauber.reichweite.ReichweiteLookupCall;

@RunWithSubject("anonymous")
@RunWith(ServerTestRunner.class)
@RunWithServerSession(ServerSession.class)
public class ReichweiteLookupCallTest {
	// TODO [phohm] add test cases

	protected ReichweiteLookupCall createLookupCall() {
		return new ReichweiteLookupCall();
	}

	@Test
	public void testGetDataByAll() {
		ReichweiteLookupCall call = createLookupCall();
		// TODO [phohm] fill call
		List<? extends ILookupRow<Long>> data = call.getDataByAll();
		// TODO [phohm] verify data
	}

	@Test
	public void testGetDataByKey() {
		ReichweiteLookupCall call = createLookupCall();
		// TODO [phohm] fill call
		List<? extends ILookupRow<Long>> data = call.getDataByKey();
		// TODO [phohm] verify data
	}

	@Test
	public void testGetDataByText() {
		ReichweiteLookupCall call = createLookupCall();
		// TODO [phohm] fill call
		List<? extends ILookupRow<Long>> data = call.getDataByText();
		// TODO [phohm] verify data
	}
}
