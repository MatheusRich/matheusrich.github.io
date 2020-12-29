function onDocumentReady(fn) {
  if (document.readyState === 'complete' || (document.readyState !== 'loading' && !document.documentElement.doScroll)) {
    fn();
  } else {
    document.addEventListener('DOMContentLoaded', fn);
  }
}

onDocumentReady(function () {
  responsiveNav('.nav-collapse');
});
