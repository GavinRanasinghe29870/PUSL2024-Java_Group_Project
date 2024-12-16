const container = document.querySelector(".seat-container");
    const seats = document.querySelectorAll(".row .seat:not(.occupied)");
    const count = document.getElementById("count");
    const total = document.getElementById("total");
    const adultCountElement = document.getElementById("adult-count");
    const childCountElement = document.getElementById("child-count");
    const adultIncreaseButton = document.getElementById("adult-increase");
    const adultDecreaseButton = document.getElementById("adult-decrease");
    const childIncreaseButton = document.getElementById("child-increase");
    const childDecreaseButton = document.getElementById("child-decrease");

    const hiddenAdultCount = document.getElementById("hidden-adult-count");
    const hiddenChildCount = document.getElementById("hidden-child-count");
    const hiddenTotalPrice = document.getElementById("hidden-total-price");
    const hiddenSelectedSeats = document.getElementById("hidden-selected-seats");

    const adultTicketPrice = 1000;
    const childTicketPrice = 800;

    let adultCount = 0;
    let childCount = 0;

    // Update total and count
    function updateSelectedCount() {
        const selectedSeats = document.querySelectorAll(".row .seat.selected");

        const selectedSeatsCount = selectedSeats.length;
        const selectedSeatsArray = [...selectedSeats].map(seat => seat.textContent);

        count.innerText = selectedSeatsCount;
        const totalPrice = adultCount * adultTicketPrice + childCount * childTicketPrice;
        total.innerText = "LKR " + totalPrice;

        hiddenAdultCount.value = adultCount;
        hiddenChildCount.value = childCount;
        hiddenTotalPrice.value = totalPrice;
        hiddenSelectedSeats.value = selectedSeatsArray.join(", ");
    }

    // Seat click event
    container.addEventListener("click", (e) => {
        if (
            e.target.classList.contains("seat") &&
            !e.target.classList.contains("occupied")
        ) {
            e.target.classList.toggle("selected");

            const selectedSeats = document.querySelectorAll(".row .seat.selected").length;

            if (selectedSeats > adultCount + childCount) {
                adultCount++;
            } else if (selectedSeats < adultCount + childCount) {
                if (childCount > 0) {
                    childCount--;
                } else {
                    adultCount--;
                }
            }

            adultCountElement.innerText = adultCount;
            childCountElement.innerText = childCount;

            updateSelectedCount();
        }
    });

    // Increase and decrease ticket count
    adultIncreaseButton.addEventListener("click", () => {
        const selectedSeats = document.querySelectorAll(".row .seat.selected").length;
        if (adultCount + childCount < selectedSeats) {
            adultCount++;
            adultCountElement.innerText = adultCount;
            updateSelectedCount();
        }
    });

    adultDecreaseButton.addEventListener("click", () => {
        if (adultCount > 0) {
            adultCount--;
            adultCountElement.innerText = adultCount;
            updateSelectedCount();
        }
    });

    childIncreaseButton.addEventListener("click", () => {
        const selectedSeats = document.querySelectorAll(".row .seat.selected").length;
        if (adultCount + childCount < selectedSeats) {
            childCount++;
            childCountElement.innerText = childCount;
            updateSelectedCount();
        }
    });

    childDecreaseButton.addEventListener("click", () => {
        if (childCount > 0) {
            childCount--;
            childCountElement.innerText = childCount;
            updateSelectedCount();
        }
    });

    // Initial count and total set
    updateSelectedCount();