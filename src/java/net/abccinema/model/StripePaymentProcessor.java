package net.abccinema.model;

/**
 *
 * @author gavin
 */
import com.stripe.Stripe;
import com.stripe.model.checkout.Session;
import com.stripe.param.checkout.SessionCreateParams;

public class StripePaymentProcessor {
    static {
        // Set your secret API key here
        Stripe.apiKey = "sk_test_51Qaig9RcIGNtXquyi0pOdcLgIJP3YzFeUPPaTwV0Px1w0g1m7ivp3iZs9ibhnJp3RdwzKom6gKjrpYPuoCNEC7k8001X03anjf";
    }

    public static String createCheckoutSession(String seatNumbers, int adultCount, int childCount, double totalPrice, String successUrl, String cancelUrl) throws Exception {
        SessionCreateParams params = SessionCreateParams.builder()
                .setMode(SessionCreateParams.Mode.PAYMENT)
                .setSuccessUrl(successUrl)
                .setCancelUrl(cancelUrl)
                .addLineItem(
                    SessionCreateParams.LineItem.builder()
                        .setQuantity(1L)
                        .setPriceData(
                            SessionCreateParams.LineItem.PriceData.builder()
                                .setCurrency("usd")
                                .setUnitAmount((long) (totalPrice * 100)) // Stripe expects amounts in cents
                                .setProductData(
                                    SessionCreateParams.LineItem.PriceData.ProductData.builder()
                                        .setName("Movie Tickets")
                                        .setDescription("Seats: " + seatNumbers)
                                        .build()
                                )
                                .build()
                        )
                        .build()
                )
                .build();

        Session session = Session.create(params);
        return session.getUrl(); // Returns the Checkout URL
    }
}
