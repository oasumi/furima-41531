const price = () => {
  const priceInput = document.getElementById("item-price");
    priceInput.addEventListener("input", () => {
      const price = Math.floor(priceInput.value);
      const addTaxDom = document.getElementById("add-tax-price");
      addTaxDom.innerHTML = Math.floor(price * 0.1 );
      const addPofitDom = document.getElementById("profit");
      addPofitDom.innerHTML = Math.floor(price - Math.floor(price * 0.1 ))
  });
};
window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);