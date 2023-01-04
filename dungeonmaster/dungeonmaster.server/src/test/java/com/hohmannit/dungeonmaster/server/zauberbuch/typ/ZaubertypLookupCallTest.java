package com.hohmannit.dungeonmaster.server.zauberbuch.typ;

import java.util.List;

import org.eclipse.scout.rt.shared.services.lookup.ILookupRow;
import org.eclipse.scout.rt.testing.platform.runner.RunWithSubject;
import org.eclipse.scout.rt.testing.server.runner.RunWithServerSession;
import org.eclipse.scout.rt.testing.server.runner.ServerTestRunner;
import org.junit.Test;
import org.junit.runner.RunWith;

import com.hohmannit.dungeonmaster.server.ServerSession;
import com.hohmannit.dungeonmaster.shared.datenbank.zauber.zaubertyp.ZaubertypLookupCall;

@RunWithSubject("anonymous")
@RunWith(ServerTestRunner.class)
@RunWithServerSession(ServerSession.class)
public class ZaubertypLookupCallTest {
	// TODO [phohm] add test cases

	protected ZaubertypLookupCall createLookupCall() {
		return new ZaubertypLookupCall();
	}

	@Test
	public void testGetDataByAll() {
		ZaubertypLookupCall call = createLookupCall();
		// TODO [phohm] fill call
		List<? extends ILookupRow<Long>> data = call.getDataByAll();
		// TODO [phohm] verify data
	}

	@Test
	public void testGetDataByKey() {
		ZaubertypLookupCall call = createLookupCall();
		// TODO [phohm] fill call
		List<? extends ILookupRow<Long>> data = call.getDataByKey();
		// TODO [phohm] verify data
	}

	@Test
	public void testGetDataByText() {
		ZaubertypLookupCall call = createLookupCall();
		// TODO [phohm] fill call
		List<? extends ILookupRow<Long>> data = call.getDataByText();
		// TODO [phohm] verify data
	}
}
