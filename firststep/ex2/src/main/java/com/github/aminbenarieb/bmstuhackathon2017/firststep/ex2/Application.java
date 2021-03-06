package com.github.aminbenarieb.bmstuhackathon2017.firststep.ex2;

import static com.github.aminbenarieb.bmstuhackathon2017.firststep.ex2.сonverters.IntegerConverter.reverse;
import java.util.Scanner;

public class Application {

    public static void main(String[] args) {

        Scanner scanner = new Scanner(System.in);
        int n = scanner.nextInt();

        int results[] = new int[n];
        for (int i=0; i<n; i++) {
            int first = scanner.nextInt();
            int second = scanner.nextInt();
            results[i] = reverse(reverse(first) + reverse(second));
        }

        for (int i: results)
            System.out.println(i);
    }

}
