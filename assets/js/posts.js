// TODO: load only on post pages
export function makeNotHighlightedLinesGray() {
  const highlightSpans = document.querySelectorAll('pre code span.hll');

  highlightSpans.forEach(highlightedSpan => {
    console.log(highlightedSpan.parentNode);
    highlightedSpan.parentNode.style.filter = 'grayscale(100%)';
  });
}
