function item_price() {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("keyup", () => {
    const fee_minus = priceInput.value * 0.1
    const fee_minus_form = document.getElementById("add-tax-price")
    fee_minus_form.innerHTML =  parseInt(fee_minus)
    
    const fee = priceInput.value * 0.9
    const fee_form = document.getElementById("profit")
    fee_form.innerHTML = parseInt(fee)
  });
}

window.addEventListener('load', item_price);