if (typeof Turbolinks === "undefined" || Turbolinks === null) {
  location.reload;
}
​
document.addEventListener('turbolinks:load', function() {
  window.onload = function() {
    if(!window.location.hash) {
        window.location = window.location;
        window.location.reload();
    }
}
});
​