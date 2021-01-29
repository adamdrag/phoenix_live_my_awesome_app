export const InitToast = {
  mounted() {
    init();
  },
};

const init = () => {
  const toastEl = document.querySelector(".toast");
  if (toastEl && toastEl.innerText !== "") {
    toastEl.classList.add("mr-8");

    setTimeout(() => {
      toastEl.classList.toggle("-mr-72", "mr-8");
    }, 3000);
  }
};

init();
