package com.hohmannit.dungeonmaster.shared.character;

import javax.annotation.Generated;

import org.eclipse.scout.rt.shared.data.basic.table.AbstractTableRowData;
import org.eclipse.scout.rt.shared.data.page.AbstractTablePageData;

/**
 * <b>NOTE:</b><br>
 * This class is auto generated by the Scout SDK. No manual modifications
 * recommended.
 */
@Generated(value = "com.hohmannit.dungeonmaster.client.character.CharacterTablePage", comments = "This class is auto generated by the Scout SDK. No manual modifications recommended.")
public class CharacterTablePageData extends AbstractTablePageData {
	private static final long serialVersionUID = 1L;

	@Override
	public CharacterTableRowData addRow() {
		return (CharacterTableRowData) super.addRow();
	}

	@Override
	public CharacterTableRowData addRow(int rowState) {
		return (CharacterTableRowData) super.addRow(rowState);
	}

	@Override
	public CharacterTableRowData createRow() {
		return new CharacterTableRowData();
	}

	@Override
	public Class<? extends AbstractTableRowData> getRowType() {
		return CharacterTableRowData.class;
	}

	@Override
	public CharacterTableRowData[] getRows() {
		return (CharacterTableRowData[]) super.getRows();
	}

	@Override
	public CharacterTableRowData rowAt(int index) {
		return (CharacterTableRowData) super.rowAt(index);
	}

	public void setRows(CharacterTableRowData[] rows) {
		super.setRows(rows);
	}

	public static class CharacterTableRowData extends AbstractTableRowData {
		private static final long serialVersionUID = 1L;
		public static final String characterId = "characterId";
		public static final String class_ = "class";
		public static final String name = "name";
		private String m_characterId;
		private String m_class;
		private String m_name;

		public String getCharacterId() {
			return m_characterId;
		}

		public void setCharacterId(String newCharacterId) {
			m_characterId = newCharacterId;
		}

		public String getClass() {
			return m_class;
		}

		public void setClass(String newClass) {
			m_class = newClass;
		}

		public String getName() {
			return m_name;
		}

		public void setName(String newName) {
			m_name = newName;
		}
	}
}
