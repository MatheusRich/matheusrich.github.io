// TODO: load only on post pages
export function dimNonHighlightedLines() {
  const highlightSpans = document.querySelectorAll('pre code span.hll');

  highlightSpans.forEach(highlightedSpan => {
    highlightedSpan.parentNode.style.filter = 'opacity(0.5)';
  });
}
