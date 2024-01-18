package com.igor.agenda_vacinacao.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;
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

    public static Date adicionarTempo(Date data, int periodicidade, int intervalo) {
        switch (periodicidade) {
            case 1:
                Calendar c = Calendar.getInstance();
                c.setTime(data);
                c.add(Calendar.DATE, intervalo);
                return c.getTime();
            case 2:
                Calendar c2 = Calendar.getInstance();
                c2.setTime(data);
                c2.add(Calendar.WEEK_OF_YEAR, intervalo);
                return c2.getTime();
            case 3:
                Calendar c3 = Calendar.getInstance();
                c3.setTime(data);
                c3.add(Calendar.MONTH, intervalo);
                return c3.getTime();
            case 4:
                Calendar c4 = Calendar.getInstance();
                c4.setTime(data);
                c4.add(Calendar.YEAR, intervalo);
                return c4.getTime();
        }
        return data;
    }
}
