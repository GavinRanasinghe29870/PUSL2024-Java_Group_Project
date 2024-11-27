package net.abccinema.model;

public class TestPurchaseDao {
    public static void main(String[] args) {
        try {
           
            purchaseDao dao = new purchaseDao();

            
            purchase purchase = new purchase();
            purchase.setName("John Doe");
            purchase.setPhoneNumber("1234567890");
            purchase.setEmail("john@example.com");
            purchase.setAdultTickets(2);
            purchase.setChildTickets(1);
            purchase.setTotalAmount(3000.00);
            purchase.setPaymentMethod("Credit Card");

            
            if (dao.insertPurchase(purchase)) {
                System.out.println("Purchase record inserted successfully!");
            } else {
                System.out.println("Failed to insert purchase record.");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
