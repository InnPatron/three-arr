module.exports = {

  "window-height": function() {
    return window.innerHeight;
  },

  "window-width": function() {
    return window.innerWidth;
  },

  "get-element": function(id) {
    return document.getElementById(id);
  },

  "modify-element": function(element, property, value) {
    element[property] = value;
  },
};
