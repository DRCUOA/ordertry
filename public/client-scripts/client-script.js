/*
*  Client-side Javascript
*/

// regisitration and login helpers:
if (document.getElementById('register-button') || document.getElementById('sign-in-button')) {
  document.getElementById('register-button').addEventListener('click', function () {
    document.getElementById('register-modal').style.display = 'block';
  });
  document.getElementById('sign-in-button').addEventListener('click', function () {
    document.getElementById('sign-in-modal').style.display = 'block';
  });

  // register
  // Get the close btn
  const closeRegButton = document.querySelector('#reg-close');

  // Get the modal element
  const modalReg = document.querySelector('#register-modal');

  // When the close button is clicked, set the modal's display property to "none"
  closeRegButton.addEventListener('click', function () {
    console.log('CLOSE BTN CLICKED')
    modalReg.style.display = "none";
  });

  // login
  const closeSignInButton = document.querySelector('#close-log-in');

  // Get the modal element
  const modalSignIn = document.querySelector('#sign-in-modal');

  // When the close button is clicked, set the modal's display property to "none"
  closeSignInButton.addEventListener('click', function () {
    modalSignIn.style.display = "none";
  });

  let header = document.querySelector('#header');
  header.style.display = "None";

  let footer = document.querySelector('#footer');
  footer.style.display = "None";

} else if (document.getElementById('chart')) {
  async function fetchData() {
    // Fetch data from endpoint
    const response = await fetch("/charts/chart-data");
    const data = await response.json();
    console.log(data);
  }
  fetchData();
}

if (document.getElementById('advice4Today')) {
  window.onload = () => {
    getAdvice();
  }
  const start = document.querySelector('#box3');
  start.addEventListener('click', () => {
    console.log('Request to start')
  })
}

if (document.querySelector('#cards-scroller')) {

  let attempts = sessionStorage.getItem('attempts') || 0;
  attempts = parseInt(attempts);
  let score = sessionStorage.getItem('score') || 0;
  score = parseInt(score);

  const radioButtons = document.querySelectorAll('input[type="radio"]');
  radioButtons.forEach(radioButton => {
    radioButton.addEventListener('click', async function (event) {
      const cardSolution = this.closest('.card').querySelector('.card-solution');

      const checkAnswer = await fetch('/cards/answer?selected=' + event.target.value)
        .then(response => {
          return response.json();
        });

      // increment attempt count and store it in local storage
      const incrementAttempts = () => {
        attempts++;
        sessionStorage.setItem('attempts', attempts);
      };

      incrementAttempts(); // increment the attempts count here

      if (checkAnswer == true) {
        // increment score and store it in local storage
        const incrementScore = () => {
          score++;
          sessionStorage.setItem('score', score);
        };

        incrementScore(); // increment the score count here

        cardSolution.innerHTML = `
        <div class="card-solution">
          <p>That&#39;s correct!</p>
          <p>Your score:  ${score} out of ${attempts} attempts.</p>
        </div>`;
        cardSolution.style.display = (cardSolution.style.display === 'none') ? 'block' : 'block';
      } else {
        cardSolution.innerHTML = `
        <div class="card-solution">
          <p>That&#39;s incorrect!</p> 
          <p>Try again, review the docs or tutorial if you need to swat up.</p>
          <p>Your score:  ${score} out of ${attempts} attempts.</p>
        </div>`;
        cardSolution.style.display = (cardSolution.style.display === 'none') ? 'block' : 'block';
      }
    });
  });
}

// helper functions:
async function getAdvice() {
  const response = await fetch('https://api.adviceslip.com/advice');
  const data = await response.json();
  document.getElementById('advice4Today').innerHTML = data.slip.advice;
}

// hamburger, nav toggle and card search
if (document.getElementById('nav') || document.getElementById('hamburger')) {

  const nav = document.getElementById("nav");
  const hamburgerMenu = document.getElementById("hamburger-menu");

  function toggleNav() {
    if (nav.style.display === "flex") {
      if (document.getElementById("advice4Today")) {
        document.getElementById("advice4Today").style.display = 'block';
      }
      nav.style.display = "none";
      hamburgerMenu.classList.remove("open");
    } else {
      if (document.getElementById("advice4Today")) {
        document.getElementById("advice4Today").style.display = 'none';
      }
      nav.style.display = "flex";
      nav.style.flexDirection = "column";
      hamburgerMenu.classList.add("open");
    }
  };

  // enable search of question cards
  if (document.getElementById("search-form")) {
    document.getElementById("search-form").addEventListener("submit", function (event) {
      event.preventDefault();
      const searchTerm = document.getElementById("search-input").value;
      window.location.href = `/cards/card-scroll/search?searchTerm=${encodeURIComponent(searchTerm)}`;
    });
  };
}