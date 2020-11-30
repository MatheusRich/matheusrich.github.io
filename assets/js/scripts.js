function onDocumentReady(fn) {
  if (document.readyState === 'complete' || (document.readyState !== 'loading' && !document.documentElement.doScroll)) {
    fn();
  } else {
    document.addEventListener('DOMContentLoaded', fn);
  }
}

onDocumentReady(function () {
  responsiveNav('.nav-collapse');

  // Round Reading Time
  // var timeSpan = document.querySelector('.time');
  // if (!timeSpan) return;
  // var time = timeSpan.textContent;
  // timeSpan.textContent = Math.round(parseFloat(time));
});
