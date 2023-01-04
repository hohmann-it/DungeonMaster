package com.hohmannit.dungeonmaster.server.datenbank.charaktere;

public interface CharaktereSQLs {

	String CHARAKTERE_PAGE_SELECT = "SELECT charakter_id, klasse, name" + "	FROM od.charaktere;";

	String CHARAKTERE_PAGE_DATA_SELECT_INTO = " INTO :{page.charakterId}, :{page.klasse}, :{page.name}";
}
