document.addEventListener("DOMContentLoaded", function () {
    const payNowButton = document.getElementById("paynow-button");

    if (payNowButton) {
        payNowButton.addEventListener("click", function (event) {
            const paymentMethod = document.getElementById("paymentMethod").value;

            if (paymentMethod === "Stripe") {
                // Redirect to servlet for Stripe payment
                event.preventDefault();
                document.getElementById("checkoutForm").submit();
            }
        });
    }
});


