emailjs.init('kVB0utlxfeysWQyzE');

const btn = document.getElementById('paynow-button');

document.getElementById('form')
 .addEventListener('submit', function(event) {
   event.preventDefault();

   btn.value = 'Sending...';

   const serviceID = 'service_0rfopse';
   const templateID = 'template_g7367ka';

   emailjs.sendForm(serviceID, templateID, this)
    .then(() => {
      btn.value = 'Pay Now';
      alert('Email Sent!');
    }, (err) => {
      btn.value = 'Pay Now';
      alert(JSON.stringify(err));
    });
});

