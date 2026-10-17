// Untimed native HOST route/snapshot diagnostic. See the repository LICENSE.
import java.text.spi.DecimalFormatSymbolsProvider;
import java.text.spi.NumberFormatProvider;
import java.util.Locale;
import java.util.Scanner;
import sun.util.locale.provider.LocaleProviderAdapter;

public class ScannerHost {
    public static void main(String[] args) {
        Locale locale = Locale.getDefault(Locale.Category.FORMAT);
        System.out.println("locale=" + locale.toLanguageTag());
        System.out.println("number=" + LocaleProviderAdapter.getAdapter(NumberFormatProvider.class, locale).getAdapterType());
        System.out.println("symbols=" + LocaleProviderAdapter.getAdapter(DecimalFormatSymbolsProvider.class, locale).getAdapterType());
        try (Scanner scanner = new Scanner("word")) {
            System.out.println("constructor=" + scanner);
            scanner.useLocale(Locale.ROOT);
            System.out.println("useLocale=" + scanner);
            scanner.reset();
            System.out.println("reset=" + scanner);
        }
    }
}
