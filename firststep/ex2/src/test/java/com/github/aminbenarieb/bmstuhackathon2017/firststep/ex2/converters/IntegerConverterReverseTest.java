package com.github.aminbenarieb.bmstuhackathon2017.firststep.ex2.converters;

import com.github.aminbenarieb.bmstuhackathon2017.firststep.ex2.сonverters.IntegerConverter;
import org.junit.Test;
import static org.junit.Assert.*;

public class IntegerConverterReverseTest {

    @Test
    public void when_0_return_0() {
        int result = IntegerConverter.reverse(0);
        int expected = 0;

        assertEquals(expected, result);
    }

    @Test
    public void when_5_return_5() {
        int result = IntegerConverter.reverse(5);
        int expected = 5;

        assertEquals(expected, result);
    }

    @Test
    public void when_10_return_1() {
        int result = IntegerConverter.reverse(10);
        int expected = 1;

        assertEquals(expected, result);
    }

    @Test
    public void when_100_return_1() {
        int result = IntegerConverter.reverse(100);
        int expected = 1;

        assertEquals(expected, result);
    }

    @Test
    public void when_10001000_return_10001() {
        int result = IntegerConverter.reverse(10001000);
        int expected = 10001;

        assertEquals(expected, result);
    }

    @Test
    public void when_1234567890_return_987654321() {
        int result = IntegerConverter.reverse(1234567890);
        int expected = 987654321;

        assertEquals(expected, result);
    }

}
