package com.github.aminbenarieb.bmstuhackathon2017.firststep.ex2.сonverters;

public class IntegerConverter {

    public static int reverse(int number) {

        StringBuilder builder = new StringBuilder(String.valueOf(number));

        while (builder.length() > 1 && builder.charAt(builder.length()-1) == '0')
            builder.deleteCharAt(builder.length()-1);

        builder = builder.reverse();

        return Integer.valueOf(builder.toString());
    }

}
