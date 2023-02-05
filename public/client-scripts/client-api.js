/*
*  Client-side Javascript
*
*  To handle client calls and responses to-form api endpoints
*/

// enable search of question cards
if (document.querySelector("#prompt-form")) {
  document.querySelector("#prompt-form").addEventListener("submit", function (event) {
    event.preventDefault();
    const prompt = document.querySelector("#prompt-input").value;
    window.location.href = `/api/completion?prompt=${encodeURIComponent(prompt)}`;
  });
};