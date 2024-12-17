const btn = document.getElementById('paynow-button');

  document.getElementById('checkoutForm').addEventListener('submit', function(event) {
    event.preventDefault();

    btn.value = 'Sending...'; 

    const serviceID = 'service_0rfopse'; 
    const templateID = 'template_g7367ka'; 

    
    const form = this;
    const formData = new FormData(form);

    // Send email using EmailJS
    emailjs.sendForm(serviceID, templateID, form)
      .then(() => {
        alert('Email Sent!');
        btn.value = 'Pay Now'; 

        // Submit the form to the servlet after email is sent successfully
        form.submit(); 
      })
      .catch((err) => {
        alert('Error sending email: ' + JSON.stringify(err)); 
        btn.value = 'Pay Now'; 
      });
  });

