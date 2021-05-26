
// @flow
"use strict";

const button = document.getElementById("butn");
if (!button) {
  throw "invalid button";
}

const text = document.getElementById("textbox");
if (!text) {
  throw "invalid textbox";
}
if (!(text instanceof HTMLInputElement))
{
  throw "textbox not HTMLInputElement";
}

const result = document.getElementById("output");
if (!result) {
  throw "invalid result";
}

button.addEventListener("click", function () {
  result.innerHTML = text.value;
} );
