const toggle = document.querySelector('.nav-toggle');
const nav = document.querySelector('.nav-collapse');

toggle.addEventListener('click', () => {
  const expanded = toggle.getAttribute('aria-expanded') === 'true';
  toggle.setAttribute('aria-expanded', !expanded);
  toggle.classList.toggle('active');
  nav.classList.toggle('opened');
  document.body.classList.toggle('nav-open');
});

window.matchMedia('(min-width: 800px)').addEventListener('change', (e) => {
  if (e.matches) {
    toggle.classList.remove('active');
    toggle.setAttribute('aria-expanded', false);
    nav.classList.remove('opened');
    document.body.classList.remove('nav-open');
  }
});
