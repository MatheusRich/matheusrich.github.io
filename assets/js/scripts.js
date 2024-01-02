import { onDocumentReady } from './utils.js';

onDocumentReady(function () {
  document.querySelector('.nav-collapse').style = "";
  responsiveNav('.nav-collapse', {
    label: "",
  });
});
