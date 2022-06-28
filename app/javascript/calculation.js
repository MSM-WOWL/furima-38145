function calculation (){
  const itemPrice = document.getElementById("item-price");
  itemPrice.addEventListener("keyup", () => {
    const readVal = itemPrice.value;
    const addTaxPrice = document.getElementById("add-tax-price");
    addTaxPrice.innerHTML = `${ Math.trunc(readVal * 0.1) }`;
    const profit = document.getElementById("profit");
    profit.innerHTML = `${ Math.trunc(readVal * 0.9) }`;
  });
};

window.addEventListener('load', calculation);