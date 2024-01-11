package com.igor.agenda_vacinacao.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class FormatterDate {
    public static Date stringToDate(String data) {
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        try {
            return formatter.parse(data);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public static String dateToString(Date data) {
        SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
        try {
            return formatter.format(data);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
