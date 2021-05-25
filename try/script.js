
// @flow
"use strict";

window.onload = main;
function fun()
{
  const text = document.getElementById("textbox");
  if (!text) {
    throw "invalid textbox";
  }
  const result = document.getElementById("output");
  if (!result) {
    throw "invalid result";
  }
  result.innerHTML = text.itemValue;
}
function main()
{
  const button = document.getElementById("butn");
  if (!button) {
    throw "invalid button";
  }
  button.addEventListener("click", fun);
  return;
}
